Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D6085F90
	for <lists.iommu@lfdr.de>; Thu,  8 Aug 2019 12:26:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D272F10B1;
	Thu,  8 Aug 2019 10:26:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DFA7210A8
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 10:26:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7907B82D
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 10:26:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8BF8768B02; Thu,  8 Aug 2019 12:26:52 +0200 (CEST)
Date: Thu, 8 Aug 2019 12:26:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 02/11] mm/mmu_notifiers: do not speculatively
	allocate a mmu_notifier_mm
Message-ID: <20190808102652.GC648@lst.de>
References: <20190806231548.25242-1-jgg@ziepe.ca>
	<20190806231548.25242-3-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806231548.25242-3-jgg@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>,
	"David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
	Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
	Gavin Shan <shangw@linux.vnet.ibm.com>,
	Andrea Righi <andrea@betterlinux.com>,
	linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	"Kuehling, Felix" <Felix.Kuehling@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
	Jason Gunthorpe <jgg@mellanox.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, Aug 06, 2019 at 08:15:39PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> A prior commit e0f3c3f78da2 ("mm/mmu_notifier: init notifier if necessary")
> made an attempt at doing this, but had to be reverted as calling
> the GFP_KERNEL allocator under the i_mmap_mutex causes deadlock, see
> commit 35cfa2b0b491 ("mm/mmu_notifier: allocate mmu_notifier in advance").
> 
> However, we can avoid that problem by doing the allocation only under
> the mmap_sem, which is already happening.
> 
> Since all writers to mm->mmu_notifier_mm hold the write side of the
> mmap_sem reading it under that sem is deterministic and we can use that to
> decide if the allocation path is required, without speculation.
> 
> The actual update to mmu_notifier_mm must still be done under the
> mm_take_all_locks() to ensure read-side coherency.
> 
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
