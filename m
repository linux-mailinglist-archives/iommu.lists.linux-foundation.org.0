Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3BA26BC54
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 08:14:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D68008720D;
	Wed, 16 Sep 2020 06:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwcuTKHVdHZ2; Wed, 16 Sep 2020 06:14:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7240C87250;
	Wed, 16 Sep 2020 06:14:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5939BC0859;
	Wed, 16 Sep 2020 06:14:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 233DCC0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 11C9D8723B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHYVK4GbEyeI for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 06:14:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E79C58720D
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:14:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3122868B05; Wed, 16 Sep 2020 08:13:59 +0200 (CEST)
Date: Wed, 16 Sep 2020 08:13:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 6/6] dma-mapping: introduce DMA range map, supplanting
 dma_pfn_offset
Message-ID: <20200916061359.GA8424@lst.de>
References: <20200914073343.1579578-1-hch@lst.de>
 <20200914073343.1579578-7-hch@lst.de> <20200914230147.GA3251212@xps15>
 <20200915054122.GA18079@lst.de> <20200915195501.GA3666944@xps15>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915195501.GA3666944@xps15>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org,
 loic.pallardy.st.com@lst.de, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 arnaud.pouliquen@st.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jim Quinlan <james.quinlan@broadcom.com>,
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

On Tue, Sep 15, 2020 at 01:55:01PM -0600, Mathieu Poirier wrote:
> That did the trick - the stm32 platform driver's probe() function completes and
> the remote processor is operatinal. 
> 
> That being said the value returned by function dma_to_pfn()
> is 0x137fff in the original code and 0xfffff with your patches applied.

Yes, that is intentional.  The old code just applied the range and got
an out of range offset, the new one reports the max offset.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
