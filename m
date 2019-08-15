Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B38E164
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 01:56:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C750ECB7;
	Wed, 14 Aug 2019 23:56:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 66C525AA
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 23:56:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D240DCF
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 23:56:04 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d549f960003>; Wed, 14 Aug 2019 16:56:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Wed, 14 Aug 2019 16:56:04 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Wed, 14 Aug 2019 16:56:04 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 14 Aug 2019 23:56:02 +0000
Subject: Re: [PATCH v3 hmm 00/11] Add mmu_notifier_get/put for managing mmu
	notifier registrations
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>
References: <20190806231548.25242-1-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <5c836cd9-3c20-aaea-8e98-e6d92e6879d9@nvidia.com>
Date: Wed, 14 Aug 2019 16:56:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1565826967; bh=KQZIZADkTJTVQx2WPyHcZuejYCxTybKh1hB7YAzhaws=;
	h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
	Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	Content-Transfer-Encoding;
	b=DPQAE2pgSQl/XQn1sjjM9NrKUE4dIfRSf7GHRsdRrmPgihcpBk5GabDJW04Y61TSS
	7iAncQ3+R1+zgw3UEbBaoE6pxrkmIYOeqhpoN16KZs/TsqsxdJ7djkvTLnIdMXr3NZ
	MVIMdUI9Q0Ivtmh86bTP2EH6iSvh/Fs1CI4WxT4AwNTtCCdOzKeSza9E3gIVs+zCaf
	g+7s7qtlxYKTA3dgKGsvDrDH7MrVctT0aqnVuDzqleqRtjf1u7r3PA3avRVgwlnqhC
	czXgQ20q0CQOn4peDoypa5Awpun++K0FRd7ut9Npwa0KmwUlGmgCSmGvNNSlheFdH6
	E0wJVcbqJ+BkQ==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>,
	"David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
	Dimitri Sivanich <sivanich@sgi.com>,
	Gavin Shan <shangw@linux.vnet.ibm.com>,
	Andrea Righi <andrea@betterlinux.com>,
	linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	"Kuehling, Felix" <Felix.Kuehling@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	=?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
	=?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
	iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
	Jason Gunthorpe <jgg@mellanox.com>, Alex
	Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
	Christoph Hellwig <hch@lst.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


On 8/6/19 4:15 PM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> This series introduces a new registration flow for mmu_notifiers based on
> the idea that the user would like to get a single refcounted piece of
> memory for a mm, keyed to its use.
> 
> For instance many users of mmu_notifiers use an interval tree or similar
> to dispatch notifications to some object. There are many objects but only
> one notifier subscription per mm holding the tree.
> 
> Of the 12 places that call mmu_notifier_register:
>   - 7 are maintaining some kind of obvious mapping of mm_struct to
>     mmu_notifier registration, ie in some linked list or hash table. Of
>     the 7 this series converts 4 (gru, hmm, RDMA, radeon)
> 
>   - 3 (hfi1, gntdev, vhost) are registering multiple notifiers, but each
>     one immediately does some VA range filtering, ie with an interval tree.
>     These would be better with a global subsystem-wide range filter and
>     could convert to this API.
> 
>   - 2 (kvm, amd_iommu) are deliberately using a single mm at a time, and
>     really can't use this API. One of the intel-svm's modes is also in this
>     list
> 
> The 3/7 unconverted drivers are:
>   - intel-svm
>     This driver tracks mm's in a global linked list 'global_svm_list'
>     and would benefit from this API.
> 
>     Its flow is a bit complex, since it also wants a set of non-shared
>     notifiers.
> 
>   - i915_gem_usrptr
>     This driver tracks mm's in a per-device hash
>     table (dev_priv->mm_structs), but only has an optional use of
>     mmu_notifiers.  Since it still seems to need the hash table it is
>     difficult to convert.
> 
>   - amdkfd/kfd_process
>     This driver is using a global SRCU hash table to track mm's
> 
>     The control flow here is very complicated and the driver is relying on
>     this hash table to be fast on the ioctl syscall path.
> 
>     It would definitely benefit, but only if the ioctl path didn't need to
>     do the search so often.
> 
> This series is already entangled with patches in the hmm & RDMA tree and
> will require some git topic branches for the RDMA ODP stuff. I intend for
> it to go through the hmm tree.
> 
> There is a git version here:
> 
> https://github.com/jgunthorpe/linux/commits/mmu_notifier
> 
> Which has the required pre-patches for the RDMA ODP conversion that are
> still being reviewed.
> 
> Jason Gunthorpe (11):
>    mm/mmu_notifiers: hoist do_mmu_notifier_register down_write to the
>      caller
>    mm/mmu_notifiers: do not speculatively allocate a mmu_notifier_mm
>    mm/mmu_notifiers: add a get/put scheme for the registration
>    misc/sgi-gru: use mmu_notifier_get/put for struct gru_mm_struct
>    hmm: use mmu_notifier_get/put for 'struct hmm'
>    RDMA/odp: use mmu_notifier_get/put for 'struct ib_ucontext_per_mm'
>    RDMA/odp: remove ib_ucontext from ib_umem
>    drm/radeon: use mmu_notifier_get/put for struct radeon_mn
>    drm/amdkfd: fix a use after free race with mmu_notifer unregister
>    drm/amdkfd: use mmu_notifier_put
>    mm/mmu_notifiers: remove unregister_no_release
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 -
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c |  88 ++++-----
>   drivers/gpu/drm/nouveau/nouveau_drm.c    |   3 +
>   drivers/gpu/drm/radeon/radeon.h          |   3 -
>   drivers/gpu/drm/radeon/radeon_device.c   |   2 -
>   drivers/gpu/drm/radeon/radeon_drv.c      |   2 +
>   drivers/gpu/drm/radeon/radeon_mn.c       | 157 ++++------------
>   drivers/infiniband/core/umem.c           |   4 +-
>   drivers/infiniband/core/umem_odp.c       | 183 ++++++------------
>   drivers/infiniband/core/uverbs_cmd.c     |   3 -
>   drivers/infiniband/core/uverbs_main.c    |   1 +
>   drivers/infiniband/hw/mlx5/main.c        |   5 -
>   drivers/misc/sgi-gru/grufile.c           |   1 +
>   drivers/misc/sgi-gru/grutables.h         |   2 -
>   drivers/misc/sgi-gru/grutlbpurge.c       |  84 +++------
>   include/linux/hmm.h                      |  12 +-
>   include/linux/mm_types.h                 |   6 -
>   include/linux/mmu_notifier.h             |  40 +++-
>   include/rdma/ib_umem.h                   |   2 +-
>   include/rdma/ib_umem_odp.h               |  10 +-
>   include/rdma/ib_verbs.h                  |   3 -
>   kernel/fork.c                            |   1 -
>   mm/hmm.c                                 | 121 +++---------
>   mm/mmu_notifier.c                        | 230 +++++++++++++++++------
>   25 files changed, 408 insertions(+), 559 deletions(-)

For the core MM, HMM, and nouveau changes you can add:
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
