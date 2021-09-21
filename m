Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591E413762
	for <lists.iommu@lfdr.de>; Tue, 21 Sep 2021 18:19:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F7DA826D5;
	Tue, 21 Sep 2021 16:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xw-f8eM42ulk; Tue, 21 Sep 2021 16:19:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2B87E82479;
	Tue, 21 Sep 2021 16:19:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09FFCC001E;
	Tue, 21 Sep 2021 16:19:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2D15C000D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 16:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90A22403EB
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 16:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpswEQr4nuWy for <iommu@lists.linux-foundation.org>;
 Tue, 21 Sep 2021 16:19:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BEF6400EB
 for <iommu@lists.linux-foundation.org>; Tue, 21 Sep 2021 16:19:32 +0000 (UTC)
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HDRQN2PlBz67Cqk;
 Wed, 22 Sep 2021 00:17:00 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Tue, 21 Sep 2021 18:19:28 +0200
Received: from [10.47.82.229] (10.47.82.229) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 21 Sep
 2021 17:19:28 +0100
Subject: Re: [PATCH] iommu/arm-smmu-v3: poll cmdq until it has space
To: Fernand Sieber <sieberf@amazon.com>, <will@kernel.org>,
 <robin.murphy@arm.com>
References: <20210921114338.1144521-1-sieberf@amazon.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <c1c10203-ffd3-25f9-f2c6-9cee3458aac9@huawei.com>
Date: Tue, 21 Sep 2021 17:22:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20210921114338.1144521-1-sieberf@amazon.com>
Content-Language: en-US
X-Originating-IP: [10.47.82.229]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 21/09/2021 12:43, Fernand Sieber wrote:
>   	do {

I didn't follow the full logic of this change yet ...

>   		llq->val = READ_ONCE(cmdq->q.llq.val);
> -		if (!queue_full(llq))
> +		if (!queue_has_space(llq, n))

But is the polarity really correct? That is, if we don't have space, 
then exit with success (the function to check for space).

>   			break;
> 
> +		/*
> +		 * We must return here even if there's no space, because the producer
> +		 * having moved forward could mean that the last thread observing the
> +		 * SMMU progress has allocated space in the cmdq and moved on, leaving
> +		 * us in this waiting loop with no other thread updating
> +		 * llq->state->val.

what is llq->state->val?

> +		 */
> +		if (llq->prod != prod)
> +			return -EAGAIN;
> +
>   		ret = queue_poll(&qp);

Thanks,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
