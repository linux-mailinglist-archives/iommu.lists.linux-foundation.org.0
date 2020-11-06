Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E432A9E45
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 20:45:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7416C8754C;
	Fri,  6 Nov 2020 19:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ya3+anMXRQl; Fri,  6 Nov 2020 19:45:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E9FB787543;
	Fri,  6 Nov 2020 19:45:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D115FC0889;
	Fri,  6 Nov 2020 19:45:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B299C0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 19:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E0692E11D
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 19:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1yqRNWIuRfX for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 19:45:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by silver.osuosl.org (Postfix) with ESMTPS id D377A2E119
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 19:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I/yMO/i0p9WTzMk8iTmPgQ7A1/uXaOZLwkcSaYry190=; b=EF51HxtZyF7eBA20tXsTF2DGDE
 IbfHm083EMnHxXpJYgIYTsp6r+mp9XWQb/XLgGWhtegx4w0IF1oPg6Iu83aOkKiOvCrjcBL1l6ogP
 F7p5WOzIjCQK9YLV8T/kmBmp579Gggn/M7dDLneVeKYVzdNnAWORs/zk7Cpponp8SJ0c/sAPS8uFI
 TdwpSPfkB9Yzi6zrO+pbtX5bsuoiEjd662srFEbfjGuxKPYx//X+W4l4VIpaOuVbk+3CZ+nG4mm4/
 C62E/EDifK+3yt9mSInjQU4Klaw8r/WG0lHCbRHdZaOWog4xjJbhQXiRfVcbPEdFxo8Ld7uiMWlFr
 NGN7kz6Q==;
Received: from s01060023bee90a7d.cg.shawcable.net ([24.64.145.4]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1kb7fV-00055w-HL; Fri, 06 Nov 2020 12:45:06 -0700
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20201106170036.18713-1-logang@deltatee.com>
 <20201106170036.18713-15-logang@deltatee.com>
 <20201106172206.GS36674@ziepe.ca>
 <b1e8dfce-d583-bed8-d04d-b7265a54c99f@deltatee.com>
 <20201106174223.GU36674@ziepe.ca>
 <2c2d2815-165e-2ef9-60d6-3ace7ff3aaa5@deltatee.com>
 <20201106180922.GV36674@ziepe.ca>
 <09885400-36f8-bc1d-27f0-a8adcf6104d4@deltatee.com>
 <20201106193024.GW36674@ziepe.ca>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <03032637-0826-da76-aec2-121902b1c166@deltatee.com>
Date: Fri, 6 Nov 2020 12:44:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106193024.GW36674@ziepe.ca>
Content-Language: en-US
X-SA-Exim-Connect-IP: 24.64.145.4
X-SA-Exim-Rcpt-To: daniel.vetter@ffwll.ch, willy@infradead.org,
 ddutile@redhat.com, jhubbard@nvidia.com, iweiny@intel.com,
 christian.koenig@amd.com, dan.j.williams@intel.com, hch@lst.de,
 sbates@raithlin.com, iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, jgg@ziepe.ca
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [RFC PATCH 14/15] PCI/P2PDMA: Introduce pci_mmap_p2pmem()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-pci@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ira Weiny <iweiny@intel.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Matthew Wilcox <willy@infradead.org>,
 John Hubbard <jhubbard@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Christoph Hellwig <hch@lst.de>
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



On 2020-11-06 12:30 p.m., Jason Gunthorpe wrote:
>> I certainly can't make decisions for code that isn't currently
>> upstream.
> 
> The rdma drivers are all upstream, what are you thinking about?

Really? I feel like you should know what I mean here...

I mean upstream code that actually uses the APIs that I'd have to
introduce. I can't say here's an API feature that no code uses but the
already upstream rdma driver might use eventually. It's fairly easy to
send patches that make the necessary changes when someone adds a use of
those changes inside the rdma code.

>> Ultimately, if you aren't using the genpool you will have to implement
>> your own mmap operation that somehow allocates the pages and your own
>> page_free hook. 
> 
> Sure, the mlx5 driver already has a specialized alloctor for it's BAR
> pages.

So it *might* make sense to carve out a common helper to setup a VMA for
P2PDMA to do the vm_flags check and set VM_MIXEDMAP... but besides that,
there's no code that would be common to the two cases.

>> I also don't expect this to be going upstream in the near term so don't
>> get too excited about using it.
> 
> I don't know, it is actually not that horrible, the GUP and IOMMU
> related changes are simpler than I expected

I think the deal breaker is the SGL hack and the fact that there are
important IOMMU implementations that won't have support.

Logan

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
