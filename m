Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E682EC840
	for <lists.iommu@lfdr.de>; Thu,  7 Jan 2021 03:45:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 53F8E20404;
	Thu,  7 Jan 2021 02:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nzyJMn8xi8I; Thu,  7 Jan 2021 02:45:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4471420133;
	Thu,  7 Jan 2021 02:45:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 229B5C013A;
	Thu,  7 Jan 2021 02:45:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 122E9C013A
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 02:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EC5E88673C
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 02:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LROIWlHN5CW9 for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jan 2021 02:45:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4C6F186723
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 02:45:36 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DB9YL2NYrzMGLC;
 Thu,  7 Jan 2021 10:44:22 +0800 (CST)
Received: from [127.0.0.1] (10.40.193.166) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Thu, 7 Jan 2021
 10:45:22 +0800
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Subject: Consult on ARM SMMU debugfs
To: <will@kernel.org>, <robin.murphy@arm.com>
Message-ID: <cd9296f1-a3ea-d8d6-0e14-2cd6f19a17da@hisilicon.com>
Date: Thu, 7 Jan 2021 10:45:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
X-Originating-IP: [10.40.193.166]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Will,  Robin or other guys,

When debugging SMMU/SVA issue on huawei ARM64 board, we find that it 
lacks of enough debugfs for ARM SMMU driver (such as

the value of STE/CD which we need to check sometimes). Currently it 
creates top-level iommu directory in debugfs, but there is no debugfs

for ARM SMMU driver specially. Do you know whether ARM have the plan to 
do that recently?


Best regards,

Shawn


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
