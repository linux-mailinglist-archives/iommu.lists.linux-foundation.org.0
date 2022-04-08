Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC14F8EFD
	for <lists.iommu@lfdr.de>; Fri,  8 Apr 2022 09:06:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA8A14197F;
	Fri,  8 Apr 2022 07:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSCt_FpBFFPp; Fri,  8 Apr 2022 07:06:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AF26D41993;
	Fri,  8 Apr 2022 07:06:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CE0AC0073;
	Fri,  8 Apr 2022 07:06:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E22BC0012
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 07:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73F954012F
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 07:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAnM9ZqIH_OG for <iommu@lists.linux-foundation.org>;
 Fri,  8 Apr 2022 07:06:36 +0000 (UTC)
X-Greylist: delayed 00:19:30 by SQLgrey-1.8.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 446094010E
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 07:06:36 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nciOb-0003vs-Ed; Fri, 08 Apr 2022 08:47:01 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nciOX-0004QL-RB; Fri, 08 Apr 2022 08:46:57 +0200
Date: Fri, 8 Apr 2022 08:46:57 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/rockchip: Refactor IOMMU initialisation
Message-ID: <20220408064657.GN4012@pengutronix.de>
References: <94eee7ab434fe11eb0787f691e9f1ab03a2e91be.1649168685.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94eee7ab434fe11eb0787f691e9f1ab03a2e91be.1649168685.git.robin.murphy@arm.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:41:25 up 8 days, 19:11, 51 users, load average: 0.08, 0.10, 0.13
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: iommu@lists.linux-foundation.org
Cc: linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, heiko@sntech.de
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

On Tue, Apr 05, 2022 at 03:32:50PM +0100, Robin Murphy wrote:
> Defer the IOMMU domain setup until after successfully binding
> components, so we can figure out IOMMU support directly from the VOP
> devices themselves, rather than manually inferring it from the DT (which
> also fails to account for whether the IOMMU driver is actually loaded).
> Although this is somewhat of a logical cleanup, the main motivation is
> to prepare for a change in the iommu_domain_alloc() interface.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Lightly tested on RK3288. This does stand to collide with the in-flight
> VOP2 driver a little, if only that that will want an equivalent
> rockchip_drm_dma_init_device() call too be able to use its IOMMU. I'm
> happy to help sort that out either way, it just depends on what we want
> to merge first.

I tested it with the VOP2 driver. It needed a little refactoring, I had
to move the call to rockchip_drm_dma_attach_device() from vop2_bind() to
vop2_enable(), but then it works as expected.

Assuming that this patch goes through Heikos tree just like the VOP2
driver we can merge it first. I'll base the next VOP2 round on it.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
