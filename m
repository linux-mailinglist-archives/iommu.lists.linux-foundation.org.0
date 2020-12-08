Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C93D2D2EA7
	for <lists.iommu@lfdr.de>; Tue,  8 Dec 2020 16:54:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A78EE2042A;
	Tue,  8 Dec 2020 15:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtCfksddnd6z; Tue,  8 Dec 2020 15:54:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D364220336;
	Tue,  8 Dec 2020 15:54:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF255C013B;
	Tue,  8 Dec 2020 15:54:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2BB2C013B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 15:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B1AF286FA0
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 15:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4QeqmExLh+i for <iommu@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 15:54:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AE75E86FA7
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 15:54:40 +0000 (UTC)
From: Will Deacon <will@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: joro@8bytes.org,
	John Garry <john.garry@huawei.com>
Subject: Re: [PATCH 0/3] IOMMU: Some IOVA code tidy-up
Date: Tue,  8 Dec 2020 15:54:30 +0000
Message-Id: <160743688897.2940119.3009790405455404921.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1607020492-189471-1-git-send-email-john.garry@huawei.com>
References: <1607020492-189471-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 0x7f454c46@gmail.com, linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kernel-team@android.com,
 robin.murphy@arm.com
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

On Fri, 4 Dec 2020 02:34:49 +0800, John Garry wrote:
> This series contains some minor tidy-ups by deleting an unreferenced
> function and unexporting some functions, highlighted by:
> https://lore.kernel.org/linux-iommu/6e09d847-fb7f-1ec1-02bf-f0c8b315845f@huawei.com/T/#med5a019f9d3835c162c16a48f34d05cc0111b0ca
> 
> John Garry (3):
>   iommu: Delete split_and_remove_iova()
>   iommu: Stop exporting alloc_iova_mem()
>   iommu: Stop exporting free_iova_mem()
> 
> [...]

Applied to arm64 (for-next/iommu/iova), thanks!

[1/3] iommu: Delete split_and_remove_iova()
      https://git.kernel.org/arm64/c/2f24dfb71208
[2/3] iommu: Stop exporting alloc_iova_mem()
      https://git.kernel.org/arm64/c/51b70b817b18
[3/3] iommu: Stop exporting free_iova_mem()
      https://git.kernel.org/arm64/c/176cfc187c24

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
