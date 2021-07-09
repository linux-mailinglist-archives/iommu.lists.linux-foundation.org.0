Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B103C221A
	for <lists.iommu@lfdr.de>; Fri,  9 Jul 2021 12:16:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BCCE4028B;
	Fri,  9 Jul 2021 10:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5PAdOWnUorO; Fri,  9 Jul 2021 10:16:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 53A7C40265;
	Fri,  9 Jul 2021 10:16:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 222E5C0022;
	Fri,  9 Jul 2021 10:16:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5614BC000E
 for <iommu@lists.linux-foundation.org>; Fri,  9 Jul 2021 10:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36B0E40265
 for <iommu@lists.linux-foundation.org>; Fri,  9 Jul 2021 10:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHVtNbLgyWfL for <iommu@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 10:16:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D223D400FF
 for <iommu@lists.linux-foundation.org>; Fri,  9 Jul 2021 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+5TICEsa94xNlu+MZ0tydmQ+U5vWint8NY+YS0CgtLc=; b=W8AmzrPBw7iJxbKQeZ5eRqIIA
 7cNn5zbRxcRp8/Bpt/6v0HIEDFr+LIQ7VSYSqujbtWV3MYYBlNe1KH+XLAKoasU5R03JgGF34bXAU
 F++yS6EC0aLTznbLp87HXkbuZFt93AnbhiQM3rnqe15JiK6etWyXxBgRz2h7f3ZdINkeS1idhQGUm
 aH+IMcLZJjB84ps5Elmh/bvEpmrWq+zS4mCCO0jdPynOGIgJbh3wh/2cnqt81+Kck1ELm4nzZnrYx
 ecZXDEab/e/8+bmdrhljGmC0j4L2Ciiet30zPajs6ytzj48B7VY6dtwP0xrvl7NjpKrfS6JF4cBc9
 ur8ckvLGg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45908)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1m1nYO-0001ii-Ni; Fri, 09 Jul 2021 11:16:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1m1nYM-0004st-Dy; Fri, 09 Jul 2021 11:16:14 +0100
Date: Fri, 9 Jul 2021 11:16:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ming Lei <ming.lei@redhat.com>
Subject: Re: [bug report] iommu_dma_unmap_sg() is very slow then running IO
 from remote numa node
Message-ID: <20210709101614.GZ22278@shell.armlinux.org.uk>
References: <YOgK8fdv7dOQtkET@T590>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YOgK8fdv7dOQtkET@T590>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Fri, Jul 09, 2021 at 04:38:09PM +0800, Ming Lei wrote:
> I observed that NVMe performance is very bad when running fio on one
> CPU(aarch64) in remote numa node compared with the nvme pci numa node.

Have you checked the effect of running a memory-heavy process using
memory from node 1 while being executed by CPUs in node 0?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
