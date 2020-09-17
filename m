Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E70C26E108
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 18:45:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6D1C887697;
	Thu, 17 Sep 2020 16:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X+uAxLktQ+4G; Thu, 17 Sep 2020 16:45:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F08A87628;
	Thu, 17 Sep 2020 16:45:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0531DC0051;
	Thu, 17 Sep 2020 16:45:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5D0EC0051
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 16:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9B93020468
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 16:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTpPN+-te5Eb for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 16:45:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 1F9262045C
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 16:45:18 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1B12468BEB; Thu, 17 Sep 2020 18:45:15 +0200 (CEST)
Date: Thu, 17 Sep 2020 18:45:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: support range based offsets in dma-direct v3
Message-ID: <20200917164514.GA5982@lst.de>
References: <20200916061500.1970090-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916061500.1970090-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-sh@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
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

I've pulled this into the dma-mapping for-next tree.  Thanks Jim and
everyone helping out!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
