Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C3049FE67
	for <lists.iommu@lfdr.de>; Fri, 28 Jan 2022 17:52:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2367184C73;
	Fri, 28 Jan 2022 16:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATek4DeEO2GY; Fri, 28 Jan 2022 16:52:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4621084C6B;
	Fri, 28 Jan 2022 16:52:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E655C002D;
	Fri, 28 Jan 2022 16:52:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D185AC000B
 for <iommu@lists.linux-foundation.org>; Fri, 28 Jan 2022 16:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF63684C6B
 for <iommu@lists.linux-foundation.org>; Fri, 28 Jan 2022 16:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDNQwGtdKgmS for <iommu@lists.linux-foundation.org>;
 Fri, 28 Jan 2022 16:52:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B42284C64
 for <iommu@lists.linux-foundation.org>; Fri, 28 Jan 2022 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=b3irqWqF076Mlc+LOntCm6p6KSLN91UqQqA+8Wh01Qc=; b=NHvfIEhF0/ixtc4kadk8afYyfv
 EmK2moGf6H0lAvy8u0DbEMxKPWG6tkBbObYC2jdqi1BKFMztCPS/5/jPCS4dmimuj6Ls4WHvjpUke
 sg5zypcVuYlHzobtsvL/RaLwz6aXglMWIrfa47RaTf943xxLqnVdzYhdrL9aPCKHh3Zqzr42Ccqmv
 m/ilLAMU7wkZ+KQldW2wmsfHg9AWOPN/WUzRFymSWJgUyuysY7Vw3jMQ+svdQK9bVuCk8VNgfYJWn
 s3uSXiff2qj52lDsdz+bmYd1jd/3Bpiysle+0j0eVgxMIjayh+GpH1awjFx1fNx2dCE4civRe8Pl3
 A5rYWRhw==;
Received: from s0106a84e3fe8c3f3.cg.shawcable.net ([24.64.144.200]
 helo=[192.168.0.10]) by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <logang@deltatee.com>)
 id 1nDUTZ-0068W2-0N; Fri, 28 Jan 2022 09:51:54 -0700
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20220128002614.6136-1-logang@deltatee.com>
 <20220128002614.6136-3-logang@deltatee.com> <20220128142138.GU8034@ziepe.ca>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <11f86dfe-cd3b-e807-8546-bffb3a0b2d1d@deltatee.com>
Date: Fri, 28 Jan 2022 09:51:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220128142138.GU8034@ziepe.ca>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 24.64.144.200
X-SA-Exim-Rcpt-To: alex.sierra@amd.com, rcampbell@nvidia.com,
 ckulkarnilinux@gmail.com, martin.oliveira@eideticom.com, robin.murphy@arm.com,
 ira.weiny@intel.com, helgaas@kernel.org, jianxin.xiong@intel.com,
 dave.hansen@linux.intel.com, jason@jlekstrand.net, dave.b.minturn@intel.com,
 andrzej.jakowski@intel.com, daniel.vetter@ffwll.ch, willy@infradead.org,
 ddutile@redhat.com, jhubbard@nvidia.com, christian.koenig@amd.com,
 dan.j.williams@intel.com, hch@lst.de, sbates@raithlin.com,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, jgg@ziepe.ca
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v5 02/24] mm: remove extra ZONE_DEVICE struct page refcount
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Alex Sierra <alex.sierra@amd.com>, linux-pci@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-nvme@lists.infradead.org,
 Stephen Bates <sbates@raithlin.com>, linux-mm@kvack.org,
 Jason Ekstrand <jason@jlekstrand.net>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Matthew Wilcox <willy@infradead.org>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>,
 Xiong Jianxin <jianxin.xiong@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
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



On 2022-01-28 7:21 a.m., Jason Gunthorpe wrote:
> On Thu, Jan 27, 2022 at 05:25:52PM -0700, Logan Gunthorpe wrote:
>> From: Ralph Campbell <rcampbell@nvidia.com>
>>
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
>>
>> [logang: dropped no longer used section from mm.h including
>>  page_is_devmap_managed, rebased on v5.17-rc1 (possibly poorly)]
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>  fs/dax.c                               |  4 +-
>>  include/linux/dax.h                    |  2 +-
>>  include/linux/memremap.h               |  7 +--
>>  include/linux/mm.h                     | 44 ----------------
>>  lib/test_hmm.c                         |  2 +-
>>  mm/internal.h                          |  8 +++
>>  mm/memcontrol.c                        |  6 +--
>>  mm/memremap.c                          | 70 +++++++-------------------
>>  mm/migrate.c                           |  5 --
>>  mm/page_alloc.c                        |  3 ++
>>  mm/swap.c                              | 45 ++---------------
>>  13 files changed, 46 insertions(+), 154 deletions(-)
> 
> This patch still can't be applied until the FSDAX issues are solved,
> right? See my remarks the last time it was posted..

Yes. As I mentioned in the cover, this is just to show that this
patchset is compatible with the direction this patch goes.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
