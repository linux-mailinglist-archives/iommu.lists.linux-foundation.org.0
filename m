Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43183DBB
	for <lists.iommu@lfdr.de>; Wed,  7 Aug 2019 01:17:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 43441E38;
	Tue,  6 Aug 2019 23:16:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 18A05CB1
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 23:16:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 72EFC875
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 23:16:19 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w17so5816836qto.10
	for <iommu@lists.linux-foundation.org>;
	Tue, 06 Aug 2019 16:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0FF0tXIe7rc2zq4BQfqO1Tr1iiwuQDZe0G+/mYZhPb4=;
	b=B0RBkomh8xhiu/KwJPirnADpsgmm80iyA8oyAeS7tjmLyr6+OYlG3sTHcQnHxrHuyg
	hrEV+59BPYDAolV+0C/Qm0JvE6OUmYPhPiU/hCiW2Im2VGOJ31mcwLL+A5qQ1rCZHNwb
	x+I+HX18fZ8WcbYwPofPsca2cfe1Dd0aGLylzfF8mtyBVAM+qXmK/+UgNQi+0EQzC0Kz
	oB9X6jiIokBPaNFinF6Ry/tAJjp1AH1v6xOfZIYHJxV9CiAgZfrkjAi5u5gvTirJtxfP
	ZI1nGkw+lv9ZBWXCB3lQbrDgT2UX0s56E7c4eY7X9nbudd1m6cqGwR2I36Jj2ZjMphM1
	s7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0FF0tXIe7rc2zq4BQfqO1Tr1iiwuQDZe0G+/mYZhPb4=;
	b=kdVPeS1gATKm+De0k3QkuCjdX/D696Dgr45LythhAbIY6mLcZYX/FpNwc7pwGRFi6w
	D4mH4L4sgT7lkvU/8Z2FXofE6O+JhV+jH1cEJhNk/7WPcbXy3GVXqJYESm/SiflObldq
	FyUUolHNbXzQoeHn9N7/Hq7CKMxUPWDVE3n1hZcd3ADGR6eatsRS5Zp1wsrkJmaP0MmK
	VC48J6k3Gsl43PgGZ+WuDpYXQWkHOGkx2xuwViQd043qT+WLz8aWMZnxTkIvfxiXd/KH
	2gZH4Whnb+xTQo4EeYfHL3Kwah4JjZDeEPM+5pJzkcoUsggIG4vHziUutvXloO5bQsD6
	El5Q==
X-Gm-Message-State: APjAAAWhWO+fvd7xrbPKhN5IfByimVe1DaIFWyg/3HcEluO/3IKL3+BF
	Uw19KqgGOkaCHXfp1eDsnSXjfQ==
X-Google-Smtp-Source: APXvYqwaqbdf4QIvkKtMVoSEHzYJbTOhZ2bib6YyUfojcuKh8v466IsdF9eIG1S+OrEDo9cDhi4cNQ==
X-Received: by 2002:aed:37e7:: with SMTP id j94mr5361848qtb.75.1565133378614; 
	Tue, 06 Aug 2019 16:16:18 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	o21sm10387881qtc.63.2019.08.06.16.16.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Aug 2019 16:16:17 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hv8gf-0006eA-Vd; Tue, 06 Aug 2019 20:16:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 00/11] Add mmu_notifier_get/put for managing mmu
	notifier registrations
Date: Tue,  6 Aug 2019 20:15:37 -0300
Message-Id: <20190806231548.25242-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
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

From: Jason Gunthorpe <jgg@mellanox.com>

This series introduces a new registration flow for mmu_notifiers based on
the idea that the user would like to get a single refcounted piece of
memory for a mm, keyed to its use.

For instance many users of mmu_notifiers use an interval tree or similar
to dispatch notifications to some object. There are many objects but only
one notifier subscription per mm holding the tree.

Of the 12 places that call mmu_notifier_register:
 - 7 are maintaining some kind of obvious mapping of mm_struct to
   mmu_notifier registration, ie in some linked list or hash table. Of
   the 7 this series converts 4 (gru, hmm, RDMA, radeon)

 - 3 (hfi1, gntdev, vhost) are registering multiple notifiers, but each
   one immediately does some VA range filtering, ie with an interval tree.
   These would be better with a global subsystem-wide range filter and
   could convert to this API.

 - 2 (kvm, amd_iommu) are deliberately using a single mm at a time, and
   really can't use this API. One of the intel-svm's modes is also in this
   list

The 3/7 unconverted drivers are:
 - intel-svm
   This driver tracks mm's in a global linked list 'global_svm_list'
   and would benefit from this API.

   Its flow is a bit complex, since it also wants a set of non-shared
   notifiers.

 - i915_gem_usrptr
   This driver tracks mm's in a per-device hash
   table (dev_priv->mm_structs), but only has an optional use of
   mmu_notifiers.  Since it still seems to need the hash table it is
   difficult to convert.

 - amdkfd/kfd_process
   This driver is using a global SRCU hash table to track mm's

   The control flow here is very complicated and the driver is relying on
   this hash table to be fast on the ioctl syscall path.

   It would definitely benefit, but only if the ioctl path didn't need to
   do the search so often.

This series is already entangled with patches in the hmm & RDMA tree and
will require some git topic branches for the RDMA ODP stuff. I intend for
it to go through the hmm tree.

There is a git version here:

https://github.com/jgunthorpe/linux/commits/mmu_notifier

Which has the required pre-patches for the RDMA ODP conversion that are
still being reviewed.

Jason Gunthorpe (11):
  mm/mmu_notifiers: hoist do_mmu_notifier_register down_write to the
    caller
  mm/mmu_notifiers: do not speculatively allocate a mmu_notifier_mm
  mm/mmu_notifiers: add a get/put scheme for the registration
  misc/sgi-gru: use mmu_notifier_get/put for struct gru_mm_struct
  hmm: use mmu_notifier_get/put for 'struct hmm'
  RDMA/odp: use mmu_notifier_get/put for 'struct ib_ucontext_per_mm'
  RDMA/odp: remove ib_ucontext from ib_umem
  drm/radeon: use mmu_notifier_get/put for struct radeon_mn
  drm/amdkfd: fix a use after free race with mmu_notifer unregister
  drm/amdkfd: use mmu_notifier_put
  mm/mmu_notifiers: remove unregister_no_release

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  88 ++++-----
 drivers/gpu/drm/nouveau/nouveau_drm.c    |   3 +
 drivers/gpu/drm/radeon/radeon.h          |   3 -
 drivers/gpu/drm/radeon/radeon_device.c   |   2 -
 drivers/gpu/drm/radeon/radeon_drv.c      |   2 +
 drivers/gpu/drm/radeon/radeon_mn.c       | 157 ++++------------
 drivers/infiniband/core/umem.c           |   4 +-
 drivers/infiniband/core/umem_odp.c       | 183 ++++++------------
 drivers/infiniband/core/uverbs_cmd.c     |   3 -
 drivers/infiniband/core/uverbs_main.c    |   1 +
 drivers/infiniband/hw/mlx5/main.c        |   5 -
 drivers/misc/sgi-gru/grufile.c           |   1 +
 drivers/misc/sgi-gru/grutables.h         |   2 -
 drivers/misc/sgi-gru/grutlbpurge.c       |  84 +++------
 include/linux/hmm.h                      |  12 +-
 include/linux/mm_types.h                 |   6 -
 include/linux/mmu_notifier.h             |  40 +++-
 include/rdma/ib_umem.h                   |   2 +-
 include/rdma/ib_umem_odp.h               |  10 +-
 include/rdma/ib_verbs.h                  |   3 -
 kernel/fork.c                            |   1 -
 mm/hmm.c                                 | 121 +++---------
 mm/mmu_notifier.c                        | 230 +++++++++++++++++------
 25 files changed, 408 insertions(+), 559 deletions(-)

-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
