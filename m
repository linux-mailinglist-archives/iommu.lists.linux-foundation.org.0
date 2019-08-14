Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC908E02C
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 23:51:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6CC0EE36;
	Wed, 14 Aug 2019 21:51:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 31E5BB62
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 21:51:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D59CE67F
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 21:51:10 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d54824f0003>; Wed, 14 Aug 2019 14:51:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Wed, 14 Aug 2019 14:51:09 -0700
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Wed, 14 Aug 2019 14:51:09 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 14 Aug 2019 21:51:02 +0000
Subject: Re: [PATCH v3 hmm 05/11] hmm: use mmu_notifier_get/put for 'struct
	hmm'
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>
References: <20190806231548.25242-1-jgg@ziepe.ca>
	<20190806231548.25242-6-jgg@ziepe.ca>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <66053b82-18d8-217a-b8fd-91981f66f512@nvidia.com>
Date: Wed, 14 Aug 2019 14:51:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190806231548.25242-6-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1565819471; bh=P9RT5vwQ9P2MNi7AtBxwKiWdi93Rh+sGeCthaUvRAGA=;
	h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
	Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	Content-Transfer-Encoding;
	b=KJ6GRRsAe+RAr5rTMPCCaxloTQYWmrR/WBzP+8kr7gip16nYfBHAmUHPXlbhEEm72
	FR+1qaXQZT7vWEhXvkKhupPjaHOEDSaXlGsl5ePt7QdDbrhYX1ZOOgzO3bUjs5eGS9
	+3p2cWPTV3vO98Xq4pfl3VknjdwX2ZPJG9es6I7cnO7o2mLiRqWlViag4cGHvpwwm6
	fRmMqyawH4eX8IYtQuk53VGwfUdLDby5fwgRdPtR6hKzhsePeybHVahWLcd8M89osz
	g43SKAfGSqwbLLkjdR3VJhZ4Z+aymGB3ltZywUlmcAZGnriaqzx9Dpc0q6MDtbY5EG
	961klO2uRvQ9A==
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
> This is a significant simplification, it eliminates all the remaining
> 'hmm' stuff in mm_struct, eliminates krefing along the critical notifier
> paths, and takes away all the ugly locking and abuse of page_table_lock.
> 
> mmu_notifier_get() provides the single struct hmm per struct mm which
> eliminates mm->hmm.
> 
> It also directly guarantees that no mmu_notifier op callback is callable
> while concurrent free is possible, this eliminates all the krefs inside
> the mmu_notifier callbacks.
> 
> The remaining krefs in the range code were overly cautious, drivers are
> already not permitted to free the mirror while a range exists.
> 
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Looks good.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
