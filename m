Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA530570B
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 10:36:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 42696850E9;
	Wed, 27 Jan 2021 09:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7UmXGO-2S1L; Wed, 27 Jan 2021 09:36:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 434F1844EC;
	Wed, 27 Jan 2021 09:36:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 334AFC1E6F;
	Wed, 27 Jan 2021 09:36:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 550CEC013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 09:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4271E85B71
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 09:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LLMsF4aUuM0 for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 09:36:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9E79B84C20
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 09:36:08 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DQdjl4GX9zjDTQ;
 Wed, 27 Jan 2021 17:34:51 +0800 (CST)
Received: from [127.0.0.1] (10.174.176.220) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0;
 Wed, 27 Jan 2021 17:36:01 +0800
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: Use DEFINE_RES_MEM() to simplify
 code
To: Will Deacon <will@kernel.org>
References: <20210122131448.1167-1-thunder.leizhen@huawei.com>
 <7f0b488d-f9b2-92b8-5914-2cef76b4d398@huawei.com>
 <20210127092352.GA31790@willie-the-truck>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <266dcbb7-56fb-6b29-6e50-d49fbee5a966@huawei.com>
Date: Wed, 27 Jan 2021 17:35:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210127092352.GA31790@willie-the-truck>
Content-Language: en-US
X-Originating-IP: [10.174.176.220]
X-CFilter-Loop: Reflected
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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



On 2021/1/27 17:23, Will Deacon wrote:
> On Wed, Jan 27, 2021 at 10:05:50AM +0800, Leizhen (ThunderTown) wrote:
>> I've sent another set of patches. https://lkml.org/lkml/2021/1/26/1065
>> If those patches are acceptable, then this one should be ignored.
> 
> I've already queued this one, so if you want me to drop it then you need to
> send me a revert.

Thanks. Since it's queued, keep it. I'll update the new patch set.

> 
> Will
> 
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
