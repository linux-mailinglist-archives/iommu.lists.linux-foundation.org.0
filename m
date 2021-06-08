Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550139F2E7
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 11:52:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D54EA402A0;
	Tue,  8 Jun 2021 09:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Zmup-_QUZ9L; Tue,  8 Jun 2021 09:52:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6885A40291;
	Tue,  8 Jun 2021 09:52:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D5BBC0001;
	Tue,  8 Jun 2021 09:52:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B962CC0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 09:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9382382CCB
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 09:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hwo3kzAofD72 for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 09:52:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 250D582BED
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 09:52:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6B6861008;
 Tue,  8 Jun 2021 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623145948;
 bh=MdSg7rpiSoIVrITTb6jHECeRKZ1bAbK8BpA0yQpfmhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tIlwbjAIEH040yjmjP0bpR2thsVjkvPedzwiOed2b1+oLtnctcJgmGLJqHzrEifpf
 WfYUTxJ5gK8kCKEwA6Tb6oru09ktd+Wx+xBVzmV9LsfHpDzJXXyOPlxS3qs3KpQATK
 O3gBk7wwLVIaCOzVMEPXqKJpRKanwmWCIwzdwXH8AFLkx+C8nXM8/4zl5HdBlMVa/W
 UDz3FdKDnN6LCQyq9ha3yObP0ifNvPUaH8ps9nDi5lvFrxEe24vx9I16jvGbPoQXg2
 WGdteuttlSTGwUDVzSIyHFc3A8lbZnctcDLjaxzvrHbjqvKgDHdr2vDQm0RPMTbMKw
 /99FjGHrdACLw==
Date: Tue, 8 Jun 2021 10:52:24 +0100
From: Will Deacon <will@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] iommu: Delete a duplicate check in
 iommu_change_dev_def_domain()
Message-ID: <20210608095224.GA9051@willie-the-truck>
References: <20210513075815.6382-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513075815.6382-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
 iommu <iommu@lists.linux-foundation.org>
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

On Thu, May 13, 2021 at 03:58:15PM +0800, Zhen Lei wrote:
> Function iommu_group_store_type() is the only caller of the static
> function iommu_change_dev_def_domain() and has performed
> "if (WARN_ON(!group))" detection before calling it. So the one here is
> redundant.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/iommu/iommu.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 971068da67cb91d..8cdf6a1c4bfd773 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -3059,9 +3059,6 @@ static int iommu_change_dev_def_domain(struct iommu_group *group,
>  	int ret, dev_def_dom;
>  	struct device *dev;
>  
> -	if (!group)
> -		return -EINVAL;
> -
>  	mutex_lock(&group->mutex);
>  
>  	if (group->default_domain != group->domain) {

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
