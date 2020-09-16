Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA2126BC73
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 08:17:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6BD6686972;
	Wed, 16 Sep 2020 06:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LC7sSrHSgEr; Wed, 16 Sep 2020 06:17:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13C0786A0E;
	Wed, 16 Sep 2020 06:17:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F18DBC0051;
	Wed, 16 Sep 2020 06:17:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CEC6C0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2BE77869EB
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5s18jkjDFoML for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 06:17:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 522D086972
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=s8mnqat7GGupYmev9VBKRE+GEfYSOGcbHcyGgV6dyXw=; b=guuG3Pt1J5nWsCBoJItPym1+vj
 0aeWJGDaGySTSVHSbdpYTROMBmteFH+Ivy8Zcc9K2kuDL9q/BHZaVU9P+3UB8GuUEB6nb9cpn3vJs
 wLOdAxW2P1ebiJKFM5z8soepZFlJ+GavE5MtpF9fqeNPBdaX7D4/P1FTuTOe+Sfh6XVA6A7O/CLXU
 w3qBYTP9KuYLJA+yOvt9dHDHudjL/zx/juLg4iNzT2TzEiEW1C3fGPvt2j2m3aeCKiwFIG0qemx9K
 jAsFkAcEn75npyjux686+2kMCFRQyW2+unJYAl4riVuilCbhQu8NYGFcpcfFv6dErBpR6Agd4IqhB
 RsiUOCTg==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIQkh-0006mN-CM; Wed, 16 Sep 2020 06:17:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: support range based offsets in dma-direct v3
Date: Wed, 16 Sep 2020 08:14:53 +0200
Message-Id: <20200916061500.1970090-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-sh@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>, linux-usb@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Hi all,

this series adds range-based offsets to the dma-direct implementation.  The
guts of the change are a patch from Jim with some modifications from me,
but to do it nicely we need to ARM patches to prepare for it as well.

Changes since v2:
 - fix a mismerge
 - return (phys_addr_t)-1 from translate_dma_to_phys when there is no
   matching range to fix dma_capable checks

Changes since v1:
 - rebased on top of the latests dma-mapping for-next tree
 - add two more trivial ARM cleanups
 - remove the DMA property inheritance hack in usb
 - move the remaining copy of the ranges into the remoteproc driver
   as it should not be seen as a general API, but as a quirk for
   remoteproc that we need to fix ASAP

Diffstat:
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
