Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E467C158633
	for <lists.iommu@lfdr.de>; Tue, 11 Feb 2020 00:37:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 959D3861E7;
	Mon, 10 Feb 2020 23:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkNkwnBRLleN; Mon, 10 Feb 2020 23:37:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB4C785F8D;
	Mon, 10 Feb 2020 23:37:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1800C1D88;
	Mon, 10 Feb 2020 23:37:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 349A9C1D88
 for <iommu@lists.linux-foundation.org>; Mon, 10 Feb 2020 23:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2274120020
 for <iommu@lists.linux-foundation.org>; Mon, 10 Feb 2020 23:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id apF96lpNnG4g for <iommu@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 23:37:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 46B8D2000E
 for <iommu@lists.linux-foundation.org>; Mon, 10 Feb 2020 23:37:12 +0000 (UTC)
Received: from localhost (unknown [104.132.1.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F40D7206D6;
 Mon, 10 Feb 2020 23:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581377832;
 bh=fQpQqnYEf7MvKwrBnRZJUnT0J9NgKJgcijmSIdr/c18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cM2hoNmd23mfSTK9sPXuHKGXGUb0TQe3NETEctiotIHp+2eQwIk42VvwHuxy8uu0R
 JVvK7VBmPJmLUvnPOMpJ04tyIR1gCw7GrFJSe4gjT4I96vr/2EaW0m4DAUnLjhwFMl
 D1Ghj9eJ5dAL5/qD0z97BKNctSIm7VYBrEy6RfyM=
Date: Mon, 10 Feb 2020 15:37:11 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v12 2/4] uacce: add uacce driver
Message-ID: <20200210233711.GA1787983@kroah.com>
References: <1579097568-17542-1-git-send-email-zhangfei.gao@linaro.org>
 <1579097568-17542-3-git-send-email-zhangfei.gao@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579097568-17542-3-git-send-email-zhangfei.gao@linaro.org>
Cc: jean-philippe <jean-philippe@linaro.org>, dave.jiang@intel.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 francois.ozog@linaro.org, linux-accelerators@lists.ozlabs.org,
 ilias.apalodimas@linaro.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>,
 grant.likely@arm.com, "haojian . zhuang" <haojian.zhuang@linaro.org>,
 linux-crypto@vger.kernel.org, Kenneth Lee <liguozhu@hisilicon.com>,
 guodong.xu@linaro.org, kenneth-lee-2012@foxmail.com
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

On Wed, Jan 15, 2020 at 10:12:46PM +0800, Zhangfei Gao wrote:
> From: Kenneth Lee <liguozhu@hisilicon.com>
> 
> Uacce (Unified/User-space-access-intended Accelerator Framework) targets to
> provide Shared Virtual Addressing (SVA) between accelerators and processes.
> So accelerator can access any data structure of the main cpu.
> This differs from the data sharing between cpu and io device, which share
> only data content rather than address.
> Since unified address, hardware and user space of process can share the
> same virtual address in the communication.
> 
> Uacce create a chrdev for every registration, the queue is allocated to
> the process when the chrdev is opened. Then the process can access the
> hardware resource by interact with the queue file. By mmap the queue
> file space to user space, the process can directly put requests to the
> hardware without syscall to the kernel space.
> 
> The IOMMU core only tracks mm<->device bonds at the moment, because it
> only needs to handle IOTLB invalidation and PASID table entries. However
> uacce needs a finer granularity since multiple queues from the same
> device can be bound to an mm. When the mm exits, all bound queues must
> be stopped so that the IOMMU can safely clear the PASID table entry and
> reallocate the PASID.
> 
> An intermediate struct uacce_mm links uacce devices and queues.
> Note that an mm may be bound to multiple devices but an uacce_mm
> structure only ever belongs to a single device, because we don't need
> anything more complex (if multiple devices are bound to one mm, then
> we'll create one uacce_mm for each bond).
> 
>         uacce_device --+-- uacce_mm --+-- uacce_queue
>                        |              '-- uacce_queue
>                        |
>                        '-- uacce_mm --+-- uacce_queue
>                                       +-- uacce_queue
>                                       '-- uacce_queue
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
> Signed-off-by: Zaibo Xu <xuzaibo@huawei.com>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>

Looks much saner now, thanks for all of the work on this:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Or am I supposed to take this in my tree?  If so, I can, but I need an
ack for the crypto parts.

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
