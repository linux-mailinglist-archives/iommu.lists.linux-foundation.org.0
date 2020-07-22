Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ED76822987C
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 14:49:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77DFC88215;
	Wed, 22 Jul 2020 12:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UZ3AN6pjEyF; Wed, 22 Jul 2020 12:49:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D6E7188206;
	Wed, 22 Jul 2020 12:49:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB66DC004C;
	Wed, 22 Jul 2020 12:49:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 146DBC004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 12:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E1F5E20478
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 12:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiKQsbfRhLQ5 for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 12:48:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 0A098203BA
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 12:48:58 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 682032C8; Wed, 22 Jul 2020 14:48:56 +0200 (CEST)
Date: Wed, 22 Jul 2020 14:48:55 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/2] iommu/dma: Avoid SAC address trick for PCIe devices
Message-ID: <20200722124854.GZ27672@8bytes.org>
References: <e583fc6dd1fb4ffc90310ff4372ee776f9cc7a3c.1594207679.git.robin.murphy@arm.com>
 <d412c292d222eb36469effd338e985f9d9e24cd6.1594207679.git.robin.murphy@arm.com>
 <20200713131426.GQ27672@8bytes.org>
 <ad3f66c8-7772-731d-cd0a-c5d6d46297cb@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad3f66c8-7772-731d-cd0a-c5d6d46297cb@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jonathan.lemon@gmail.com,
 dwmw2@infradead.org, hch@lst.de, linux-arm-kernel@lists.infradead.org
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

On Tue, Jul 14, 2020 at 12:42:36PM +0100, Robin Murphy wrote:
> Oh bother - yes, this could have been masking all manner of bugs. That
> system will presumably also break if you managed to exhaust the 32-bit IOVA
> space such that the allocator moved up to the higher range anyway, or if you
> passed the XHCI through to a VM with a sufficiently wacky GPA layout, but I
> guess those are cases that simply nobody's run into yet.
> 
> Does the firmware actually report any upper address constraint such that
> Sebastian's IVRS aperture patches might help?

No, it doesn't. I am not sure what the best way is to get these issues
found and fixed. I doubt they will be getting fixed when the allocation
pattern isn't changed, maybe we can put your changes behind a config
variable and start testing/reporting bugs/etc.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
