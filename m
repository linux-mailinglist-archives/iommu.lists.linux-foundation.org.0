Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D4D339924
	for <lists.iommu@lfdr.de>; Fri, 12 Mar 2021 22:37:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 491B943091;
	Fri, 12 Mar 2021 21:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n4Wr2Ay1PddE; Fri, 12 Mar 2021 21:37:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2459143089;
	Fri, 12 Mar 2021 21:37:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00046C0001;
	Fri, 12 Mar 2021 21:37:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68265C0001
 for <iommu@lists.linux-foundation.org>; Fri, 12 Mar 2021 21:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 421AC4ED1B
 for <iommu@lists.linux-foundation.org>; Fri, 12 Mar 2021 21:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tVW0quAc59CO for <iommu@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 21:37:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DB7A4ED09
 for <iommu@lists.linux-foundation.org>; Fri, 12 Mar 2021 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=T7mzuRgHR5zyL13fGxYATb0PibzAkq1gophY5Qi93V0=; b=NljsSHJkFlQ2oulW4psgZdRBZa
 qgoQiY/5e6LFm23c9qIwGHKx59Rdscll0uQCdBksaP8keL4Gv+qXd6SpMzWE3c2KTPN+Yt7TkjfMD
 VKufm9iYy9S1kM3gq5EoA8X0Iwwk+BXaeKR2DtsJwSiGP5M99l11j01GzfuA1WhYodeMJwR9eULLx
 qMCAqJ61hDuiWk9NoL/OXxGIsON+G05ZxyItH2tyiPiUwdHuiVQZbuD3Gw6w7iSs3CxWor/qKRJ+N
 iHGSbxHK1EBS+HEejQDjnyuIn1A2bZ90d2L7GIQDkwb8bf9pWbOv+q1TJdhTOcLW3uuY5x0278s54
 XVUZIIjg==;
Received: from s01060023bee90a7d.cg.shawcable.net ([24.64.145.4]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1lKpT0-0003Fl-Vh; Fri, 12 Mar 2021 14:37:07 -0700
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20210312205707.GA2288658@bjorn-Precision-5520>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <c252253e-5000-5d96-1ac8-90835c1a4eb0@deltatee.com>
Date: Fri, 12 Mar 2021 14:37:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312205707.GA2288658@bjorn-Precision-5520>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 24.64.145.4
X-SA-Exim-Rcpt-To: jianxin.xiong@intel.com, dave.hansen@linux.intel.com,
 jason@jlekstrand.net, dave.b.minturn@intel.com, andrzej.jakowski@intel.com,
 daniel.vetter@ffwll.ch, willy@infradead.org, ddutile@redhat.com,
 jhubbard@nvidia.com, iweiny@intel.com, christian.koenig@amd.com, jgg@ziepe.ca,
 dan.j.williams@intel.com, hch@lst.de, sbates@raithlin.com,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 helgaas@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [RFC PATCH v2 02/11] PCI/P2PDMA: Avoid pci_get_slot() which sleeps
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-pci@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ira Weiny <iweiny@intel.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 Stephen Bates <sbates@raithlin.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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



On 2021-03-12 1:57 p.m., Bjorn Helgaas wrote:
> On Thu, Mar 11, 2021 at 04:31:32PM -0700, Logan Gunthorpe wrote:
>> In order to use upstream_bridge_distance_warn() from a dma_map function,
>> it must not sleep. However, pci_get_slot() takes the pci_bus_sem so it
>> might sleep.
>>
>> In order to avoid this, try to get the host bridge's device from
>> bus->self, and if that is not set just get the first element in the
>> list. It should be impossible for the host bridges device to go away
>> while references are held on child devices, so the first element
>> should not change and this should be safe.
>>
>> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>> ---
>>  drivers/pci/p2pdma.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
>> index bd89437faf06..2135fe69bb07 100644
>> --- a/drivers/pci/p2pdma.c
>> +++ b/drivers/pci/p2pdma.c
>> @@ -311,11 +311,15 @@ static const struct pci_p2pdma_whitelist_entry {
>>  static bool __host_bridge_whitelist(struct pci_host_bridge *host,
>>  				    bool same_host_bridge)
>>  {
>> -	struct pci_dev *root = pci_get_slot(host->bus, PCI_DEVFN(0, 0));
>>  	const struct pci_p2pdma_whitelist_entry *entry;
>> +	struct pci_dev *root = host->bus->self;
>>  	unsigned short vendor, device;
>>  
>>  	if (!root)
>> +		root = list_first_entry_or_null(&host->bus->devices,
>> +						struct pci_dev, bus_list);
> 
> Replacing one ugliness (assuming there is a pci_dev for the host
> bridge, and that it is at 00.0) with another (still assuming a pci_dev
> and that it is host->bus->self or the first entry).  I can't suggest
> anything better, but maybe a little comment in the code would help
> future readers.

Yeah, I struggled to find a solution here; this was the best I could
come up with. I'd love it if someone had a better idea. I can add a
comment for future iterations.

> I wish we had a real way to discover this property without the
> whitelist, at least for future devices.  Was there ever any interest
> in a _DSM or similar interface for this?

I'd also like to get rid of the whitelist, but I have no idea how or who
would have to lead a fight to get the hardware to self describe in way
that we could use.

> I *am* very glad to remove a pci_get_slot() usage.
> 
>> +
>> +	if (!root || root->devfn)
>>  		return false;
>>  
>>  	vendor = root->vendor;
> 
> Don't you need to also remove the "pci_dev_put(root)" a few lines
> below?

Yes, right. Good catch!

Logan

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
