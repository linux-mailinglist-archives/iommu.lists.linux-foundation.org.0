Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A75273129
	for <lists.iommu@lfdr.de>; Mon, 21 Sep 2020 19:50:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA3028666B;
	Mon, 21 Sep 2020 17:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eNO5Gytbg4Z; Mon, 21 Sep 2020 17:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32A9986670;
	Mon, 21 Sep 2020 17:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14D38C0051;
	Mon, 21 Sep 2020 17:50:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14528C0051
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 17:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0037E85085
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 17:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01fBj1BPsRh8 for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 17:50:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 73AC68502A
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 17:50:54 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81A752067D;
 Mon, 21 Sep 2020 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600710654;
 bh=kJ5R12A5zSEcL4lH72c1d+o9AME4QY3NjcOW4b+oD2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MWTGlM4duqc7FMmw2RNe3C1k/JFeeyjmw8nyaUOKd9aKG9SQhCaap62LPMmM+p29s
 jOLQ8nuY31GUkfGcJFNpa/LzejSHN7ZLJiDUk2cqUPvROMj16n2Ftx6jxVyl7066wL
 UjqUs3Sl6g/ADwO7pVQFPQ3xEisyughhszxFQKPg=
Date: Mon, 21 Sep 2020 18:50:49 +0100
From: Will Deacon <will@kernel.org>
To: Yu Kuai <yukuai3@huawei.com>
Subject: Re: [PATCH] iommu/qcom: add missing put_device() call in
 qcom_iommu_of_xlate()
Message-ID: <20200921175048.GD3141@willie-the-truck>
References: <20200918011357.909335-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918011357.909335-1-yukuai3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: yi.zhang@huawei.com, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Fri, Sep 18, 2020 at 09:13:57AM +0800, Yu Kuai wrote:
> if of_find_device_by_node() succeed, qcom_iommu_of_xlate() doesn't have
> a corresponding put_device(). Thus add put_device() to fix the exception
> handling for this function implementation.
> 
> Fixes: e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own subdirectory")

That's probably not accurate, in that this driver used to live under
drivers/iommu/ and assumedly had this bug there as well.

> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

I guess Rob will pick this up.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
