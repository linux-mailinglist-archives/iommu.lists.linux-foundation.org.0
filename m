Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F52B7220
	for <lists.iommu@lfdr.de>; Wed, 18 Nov 2020 00:24:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B305D832C6;
	Tue, 17 Nov 2020 23:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_E4YrSMJxQu; Tue, 17 Nov 2020 23:24:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A90783F0D;
	Tue, 17 Nov 2020 23:24:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39248C07FF;
	Tue, 17 Nov 2020 23:24:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EEA8C07FF
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 23:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9A31687028
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 23:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zxt5lzXAOc+n for <iommu@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 23:24:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3B6C987027
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 23:24:35 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 33CF7208B8;
 Tue, 17 Nov 2020 23:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605655474;
 bh=DBKJOtjbMI3Jf+vIBiv48gZMtpfWzjVButwb4YODpxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LilzwPqewa1mZV61sPMMhaW6NNBS7lkwEtlxi+2C5T0U/xrMcdYWObdOeTOUgERii
 d5E8a6trunuE5+91q4kEHh8yI7EWncM1XQXEhr+/wAT5fmfPB/9vuAgBDm+RJjNsay
 np8iKj7ecgMhTR7Cq4FEpvikyGo6OrHrWWpctD0c=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Chen Jun <chenjun102@huawei.com>
Subject: Re: [PATCH] iommu: Modify the description of iommu_sva_unbind_device
Date: Tue, 17 Nov 2020 23:24:27 +0000
Message-Id: <160565435695.2778655.8468906444241988045.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201023064827.74794-1-chenjun102@huawei.com>
References: <20201023064827.74794-1-chenjun102@huawei.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, guohanjun@huawei.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, rui.xiang@huawei.com
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

On Fri, 23 Oct 2020 06:48:27 +0000, Chen Jun wrote:
> iommu_sva_unbind_device has no return value.
> 
> Remove the description of the return value of the function.

Applied to arm64 (for-next/iommu/misc), thanks!

[1/1] iommu: Modify the description of iommu_sva_unbind_device
      https://git.kernel.org/arm64/c/6243f572a18d

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
