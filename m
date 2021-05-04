Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A0372B9D
	for <lists.iommu@lfdr.de>; Tue,  4 May 2021 16:06:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0E883D2C;
	Tue,  4 May 2021 14:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-PriZyLb5Sq; Tue,  4 May 2021 14:05:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F1D83D6B;
	Tue,  4 May 2021 14:05:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05A01C001C;
	Tue,  4 May 2021 14:05:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85343C0001
 for <iommu@lists.linux-foundation.org>; Tue,  4 May 2021 10:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FE5140134
 for <iommu@lists.linux-foundation.org>; Tue,  4 May 2021 10:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTmEJwxSz5hD for <iommu@lists.linux-foundation.org>;
 Tue,  4 May 2021 10:15:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20B54400F8
 for <iommu@lists.linux-foundation.org>; Tue,  4 May 2021 10:15:57 +0000 (UTC)
Received: from chickenburger.collabora.co.uk (chickenburger.collabora.co.uk
 [46.235.227.242])
 by bhuna.collabora.co.uk (Postfix) with ESMTP id ED5DA1F42458;
 Tue,  4 May 2021 11:15:54 +0100 (BST)
From: "Ezequiel Garcia" <ezequiel.garcia@collabora.com>
In-Reply-To: <20210501013448.GA4001859@robh.at.kernel.org>
X-Forward: 190.2.109.197
Date: Tue, 04 May 2021 11:15:54 +0100
To: "Rob Herring" <robh@kernel.org>
MIME-Version: 1.0
Message-ID: <4bee-60911f00-11-7473f580@227440849>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 2/4] =?utf-8?q?dt-bindings=3A?=
 =?utf-8?q?_iommu=3A?==?utf-8?q?_rockchip=3A?= Add compatible for v2
User-Agent: SOGoMail 5.0.1
X-Mailman-Approved-At: Tue, 04 May 2021 14:05:58 +0000
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, heiko@sntech.de,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, kernel@collabora.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Rob,
 
On Friday, April 30, 2021 22:34 -03, Rob Herring <robh@kernel.org> wrote: 
 
> On Thu, Apr 22, 2021 at 04:16:00PM +0200, Benjamin Gaignard wrote:
> > Add compatible for the second version of IOMMU hardware block.
> > RK356x IOMMU can also be link to a power domain.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> > version 2:
> >  - Add power-domains property
> > 
> >  .../devicetree/bindings/iommu/rockchip,iommu.yaml          | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> > index 0db208cf724a..e54353ccd1ec 100644
> > --- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> > @@ -19,7 +19,9 @@ description: |+
> >  
> >  properties:
> >    compatible:
> > -    const: rockchip,iommu
> > +    enum:
> > +      - rockchip,iommu
> > +      - rockchip,iommu-v2
> 
> This should be SoC specific.
> 

It seems iommu-v2 is really the name Rockchip gives to this IOMMU IP core.
Can we keep the "rockchip,iommu-v2" compatible, and add SoC-specific ones, as we normally do:

compatible = "rockchip,rk3568-iommu", "rockchip,iommu-v2";

Just like we'd do with any peripheral:

compatible = "st,stm32-dwmac", "snps,dwmac-3.50a";

Thanks!
Ezequiel

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
