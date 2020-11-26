Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A472C5A4B
	for <lists.iommu@lfdr.de>; Thu, 26 Nov 2020 18:13:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 486288790B;
	Thu, 26 Nov 2020 17:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRX-GiNqXvdZ; Thu, 26 Nov 2020 17:13:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E0E5A87908;
	Thu, 26 Nov 2020 17:13:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9C94C0052;
	Thu, 26 Nov 2020 17:13:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 684F1C0052
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 17:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 648E78720D
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 17:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcqJzJAsyBHA for <iommu@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 17:13:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 174868720A
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 17:13:43 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9638821D7E;
 Thu, 26 Nov 2020 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606410822;
 bh=a6F69KFSEwwbGkU1jI6mipEDkefv4aWtBNdY/XrsELY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=moMV+t+tDMHqyhOO24Sk587oGpzApzz4zos+YpOXaOYvkdPUUPbZ5Mu0eZ7y6ZwGG
 rLs8bs8su7iUWwjX7EWgDvYhC8MvDJOkj+hHzRHPrV34hpv+D10plx/R2imdwP7kwD
 sdsYLApmKeC2dQYLz9LekNKKuXu/EIHEiEbw+3O0=
From: Will Deacon <will@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: Re: [PATCH v2] iommu: return error code when it can't get group
Date: Thu, 26 Nov 2020 17:13:33 +0000
Message-Id: <160640241299.1420618.8864801005246574667.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126133825.3643852-1-yangyingliang@huawei.com>
References: <20201126133825.3643852-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>
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

On Thu, 26 Nov 2020 21:38:25 +0800, Yang Yingliang wrote:
> It's better to return error code if it can't get group
> in iommu_probe_device(). It's no function change.

Applied to arm64 (for-next/iommu/misc), thanks!

[1/1] iommu: return error code when it can't get group
      https://git.kernel.org/arm64/c/058236eef606

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
