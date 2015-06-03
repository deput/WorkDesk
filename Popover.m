- (CGRect) rectForPopover:(MSTRPopover*) popover withContentSize:(CGSize)size fromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections
{
    CGRect retRect = CGRectZero;

    CGRect touchRect = [popover convertRect:rect fromView:view];
    if (size.width > popover.bounds.size.width - 2 * POPOVER_INSET - self.popoverArrowHeight) {
        size.width = popover.bounds.size.width - 2 * POPOVER_INSET - self.popoverArrowHeight;
    }
    if (size.height > popover.bounds.size.height - 2 * POPOVER_INSET - self.popoverArrowHeight) {
        size.height = popover.bounds.size.height - 2 * POPOVER_INSET - self.popoverArrowHeight;
    }
    
    popover.popoverContentSize = size;
    for (int i = 0; i < 1; i++) {
        
        if (arrowDirections & UIPopoverArrowDirectionDown) {
            if (size.height <= touchRect.origin.y - popover.bounds.origin.y - self.popoverArrowHeight - POPOVER_INSET * 2) {
                CGFloat y = touchRect.origin.y - self.popoverArrowHeight - size.height - POPOVER_INSET;
                CGFloat x = touchRect.origin.x + (touchRect.size.width - size.width) / 2;
                if (x < popover.bounds.origin.x + POPOVER_INSET){
                    x = popover.bounds.origin.x + POPOVER_INSET;
                }else if (x >= popover.bounds.size.width - size.width - POPOVER_INSET){
                    x = popover.bounds.size.width - size.width - POPOVER_INSET;
                }
                retRect = (CGRect){(CGPoint){x,y}, size};
                popover.popoverArrowDirection = UIPopoverArrowDirectionDown;
                break;
            }
        }
        
        if (arrowDirections & UIPopoverArrowDirectionRight) {
            if (size.width <= touchRect.origin.x - popover.bounds.origin.x - self.popoverArrowHeight - POPOVER_INSET * 2) {
                CGFloat x = touchRect.origin.x - self.popoverArrowHeight - size.width - POPOVER_INSET;
                CGFloat y = touchRect.origin.y + (touchRect.size.height - size.height) / 2 ;
                if (y < popover.bounds.origin.y + POPOVER_INSET) {
                    y = popover.bounds.origin.y + POPOVER_INSET;
                }else if (y >= popover.bounds.size.height - size.height - POPOVER_INSET ){
                    y = popover.bounds.size.height - size.height - POPOVER_INSET;
                }
                retRect = (CGRect){(CGPoint){x, y}, size};
                popover.popoverArrowDirection = UIPopoverArrowDirectionRight;
                break;
            }
        }
        
        if (arrowDirections & UIPopoverArrowDirectionLeft) {
            if (size.width <= popover.bounds.size.width - CGRectGetMaxX(touchRect) - self.popoverArrowHeight - POPOVER_INSET * 2) {
                CGFloat x = CGRectGetMaxX(touchRect) + self.popoverArrowHeight + POPOVER_INSET;
                CGFloat y = touchRect.origin.y + (touchRect.size.height - size.height) / 2 ;
                if (y < popover.bounds.origin.y + POPOVER_INSET) {
                    y = popover.bounds.origin.y + POPOVER_INSET;
                }else if (y >= popover.bounds.size.height - size.height - POPOVER_INSET ){
                    y = popover.bounds.size.height - size.height - POPOVER_INSET;
                }
                retRect = (CGRect){(CGPoint){x,y}, size};
                popover.popoverArrowDirection = UIPopoverArrowDirectionLeft;
                break;
            }
        }
        
        if (arrowDirections & UIPopoverArrowDirectionUp) {
            if (size.height <= popover.bounds.size.height - CGRectGetMaxY(touchRect) - self.popoverArrowHeight - POPOVER_INSET * 2) {
                CGFloat y = CGRectGetMaxY(touchRect) + self.popoverArrowHeight + POPOVER_INSET;
                CGFloat x = touchRect.origin.x + (touchRect.size.width - size.width) / 2;
                if (x < popover.bounds.origin.x + POPOVER_INSET){
                    x = popover.bounds.origin.x + POPOVER_INSET;
                }else if (x >= popover.bounds.size.width - size.width - POPOVER_INSET){
                    x = popover.bounds.size.width - size.width - POPOVER_INSET;
                }
                retRect = (CGRect){(CGPoint){x,y}, size};
                popover.popoverArrowDirection = UIPopoverArrowDirectionUp;
                break;
            }
        }
    }
    
    return retRect;
}
