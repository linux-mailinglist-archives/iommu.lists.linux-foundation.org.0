Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BEE275511
	for <lists.iommu@lfdr.de>; Wed, 23 Sep 2020 12:05:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 48D738612B;
	Wed, 23 Sep 2020 10:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G87lYECWH_1o; Wed, 23 Sep 2020 10:05:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9415E8610E;
	Wed, 23 Sep 2020 10:05:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7360AC0051;
	Wed, 23 Sep 2020 10:05:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EB7DC0859
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 10:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8CA4E870C0
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 10:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MuDXLx3s6tSc for <iommu@lists.linux-foundation.org>;
 Wed, 23 Sep 2020 10:05:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 880008703E
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R+6pH9MDXo8iBZE23VD1Qz4m/pWUZJggcrrvmXTMzlM=; b=ExALYf+eJ59NgDjFaLDDQWGEv
 kB/1C35EtyKiUIkhcLpRwt2PDcrbvVbTxhs5IFERtgqltUk4aum3IZLfl3DHn6oOk9imExkrI/DfF
 mhzaVNsUaMpkkbLQhXKHTfbSg+y1REpp59J3d6P0iUGuK+hCHce1nXIJLzjTZYeRCszvJQrLToSs/
 oNJZZEEsiAO8/Qqf+ddRW6OOUdIs6920AV7bpoyEPBvg5E6hV5Dp93UemFxEtQR7f1J/JJ2Wm7pWb
 MCUqyTvOeTNTsDJry0yRevPBt1739ZZIX6np7q6l66wqe3+7/ZHiM+bdessUmZturVDq2QUPP4Dpl
 6rGa0uQ7A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37216)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kL1eW-0003vf-NC; Wed, 23 Sep 2020 11:05:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kL1eQ-0003HJ-Ot; Wed, 23 Sep 2020 11:05:26 +0100
Date: Wed, 23 Sep 2020 11:05:26 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/4] ARM/omap1: switch to use dma_direct_set_offset for
 lbus DMA offsets
Message-ID: <20200923100526.GD1559@shell.armlinux.org.uk>
References: <20200917173229.3311382-1-hch@lst.de>
 <20200917173229.3311382-2-hch@lst.de>
 <20200918054933.GK7101@atomide.com> <2184547.ElGaqSPkdT@z50>
 <20200921064418.GM7101@atomide.com> <20200921064723.GA18559@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921064723.GA18559@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 linux-usb@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-omap@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
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

On Mon, Sep 21, 2020 at 08:47:23AM +0200, Christoph Hellwig wrote:
> On Mon, Sep 21, 2020 at 09:44:18AM +0300, Tony Lindgren wrote:
> > * Janusz Krzysztofik <jmkrzyszt@gmail.com> [200919 22:29]:
> > > Hi Tony,
> > > 
> > > On Friday, September 18, 2020 7:49:33 A.M. CEST Tony Lindgren wrote:
> > > > * Christoph Hellwig <hch@lst.de> [200917 17:37]:
> > > > > Switch the omap1510 platform ohci device to use dma_direct_set_offset
> > > > > to set the DMA offset instead of using direct hooks into the DMA
> > > > > mapping code and remove the now unused hooks.
> > > > 
> > > > Looks nice to me :) I still can't test this probably for few more weeks
> > > > though but hopefully Aaro or Janusz (Added to Cc) can test it.
> > > 
> > > Works for me on Amstrad Delta (tested with a USB ethernet adapter).
> > > 
> > > Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > 
> > Great, good to hear! And thanks for testing it.
> > 
> > Christoph, feel free to queue this along with the other patches:
> > 
> > Acked-by: Tony Lindgren <tony@atomide.com>
> > 
> > Or let me know if you want me to pick it up.
> 
> I'd prefer to pick it up through the dma-mapping tree, but preferably
> I'd pick the whole series up once Russell has tested footwinder.

I don't think that's going to happen very soon... seems way too much
effort to pull down the appropriate tree to build and test.  Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
