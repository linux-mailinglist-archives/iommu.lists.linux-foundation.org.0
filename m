Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3337F33D880
	for <lists.iommu@lfdr.de>; Tue, 16 Mar 2021 17:02:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A7ED83E23;
	Tue, 16 Mar 2021 16:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UC0G-GTgnGB; Tue, 16 Mar 2021 16:02:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F55983D32;
	Tue, 16 Mar 2021 16:02:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D145C000F;
	Tue, 16 Mar 2021 16:02:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56CDCC000A
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 16:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E70A6F635
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 16:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhtaqntNZGd7 for <iommu@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 16:02:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A64C16F60D
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=vqqIJKKtZ0Pg96LQ/1Z1q/KlFFpVkNAe+8aEWrs/hj4=; b=aLfuYJGuyB5Vf3NXBbVi7orqFM
 EDGLeXMnQdoQH9BV1vcMoXyuK9z93wWuPACR4VyTKSTtxBcCGLJv06fHAktuwiezT1YitAoW6wR1X
 HvT8pZhWTDbPTx4/Yx8zliILh8pVR2V/Q/NfhhuJH6rkKu0rh+ZWSfM71udHN10RroyIwvdLBmi/x
 JowULXwT9MOdkxVUpQ3witDiL5FZ4SD+ANuLnpzEKngB+XqRkzhMd/UwHnEqGWuGSt5KcVGSR2qz2
 Hoa0CJ4Ud/gwHBkjHMtsgrO77SVKESL0pH0xqOtjxAQukb1UQXUpq3zW9dr/Uu471yKxzBc7lV11d
 3TDfQv2Q==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1lMC9R-0001Oz-Na; Tue, 16 Mar 2021 10:02:34 -0600
To: Christoph Hellwig <hch@lst.de>
References: <20210311233142.7900-1-logang@deltatee.com>
 <20210311233142.7900-10-logang@deltatee.com> <20210316080051.GD15949@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <52a9e6e3-fc00-495a-69bb-26ff0b22775a@deltatee.com>
Date: Tue, 16 Mar 2021 10:02:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316080051.GD15949@lst.de>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: jianxin.xiong@intel.com, dave.hansen@linux.intel.com,
 jason@jlekstrand.net, dave.b.minturn@intel.com, andrzej.jakowski@intel.com,
 daniel.vetter@ffwll.ch, willy@infradead.org, ddutile@redhat.com,
 jhubbard@nvidia.com, iweiny@intel.com, christian.koenig@amd.com, jgg@ziepe.ca,
 dan.j.williams@intel.com, sbates@raithlin.com,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [RFC PATCH v2 09/11] block: Add BLK_STS_P2PDMA
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-pci@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ira Weiny <iweiny@intel.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 Stephen Bates <sbates@raithlin.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Matthew Wilcox <willy@infradead.org>, Jason Ekstrand <jason@jlekstrand.net>,
 John Hubbard <jhubbard@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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



On 2021-03-16 2:00 a.m., Christoph Hellwig wrote:
> On Thu, Mar 11, 2021 at 04:31:39PM -0700, Logan Gunthorpe wrote:
>> Create a specific error code for when P2PDMA pages are passed to a block
>> devices that cannot map them (due to no IOMMU support or ACS protections).
>>
>> This makes request errors in these cases more informative of as to what
>> caused the error.
> 
> I really don't think we should bother with a specific error code here,
> we don't add a new status for every single possible logic error in the
> caller.

I originally had BLK_STS_IOERR but those errors suggested to people that
the hardware had failed on the request when in fact it was a user error.
I'll try BLK_STS_TARGET unless there's any objection or someone thinks
another error code would make more sense.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
