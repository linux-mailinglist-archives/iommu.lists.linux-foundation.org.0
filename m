Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D761A16F5EC
	for <lists.iommu@lfdr.de>; Wed, 26 Feb 2020 04:05:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 672A38769F;
	Wed, 26 Feb 2020 03:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bBR-dO4sewQq; Wed, 26 Feb 2020 03:05:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D3C986506;
	Wed, 26 Feb 2020 03:05:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CA9FC0177;
	Wed, 26 Feb 2020 03:05:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D37C3C0177
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 03:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B970420418
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 03:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psKhFm+RUCEj for <iommu@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 03:05:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by silver.osuosl.org (Postfix) with ESMTPS id 80B8820131
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 03:05:26 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 782DE46488E95C5DEB79;
 Wed, 26 Feb 2020 11:05:22 +0800 (CST)
Received: from [127.0.0.1] (10.67.101.242) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 26 Feb 2020
 11:05:19 +0800
Subject: Re: [PATCH v4 03/26] iommu: Add a page fault handler
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
 <20200224182401.353359-4-jean-philippe@linaro.org>
 <cb8b5a85-7f1a-8eb7-85bd-db2f553f066d@huawei.com>
 <20200225092519.GC375953@myrica>
From: Xu Zaibo <xuzaibo@huawei.com>
Message-ID: <0c2b29ad-d09a-89db-8540-5909751b1972@huawei.com>
Date: Wed, 26 Feb 2020 11:05:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200225092519.GC375953@myrica>
X-Originating-IP: [10.67.101.242]
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, kevin.tian@intel.com,
 will@kernel.org, Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, catalin.marinas@arm.com,
 tj@kernel.org, zhangfei.gao@linaro.org, robin.murphy@arm.com,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org
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

Hi,
On 2020/2/25 17:25, Jean-Philippe Brucker wrote:
> Hi Zaibo,
>
> On Tue, Feb 25, 2020 at 11:30:05AM +0800, Xu Zaibo wrote:
>>> +struct iopf_queue *
>>> +iopf_queue_alloc(const char *name, iopf_queue_flush_t flush, void *cookie)
>>> +{
>>> +	struct iopf_queue *queue;
>>> +
>>> +	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
>>> +	if (!queue)
>>> +		return NULL;
>>> +
>>> +	/*
>>> +	 * The WQ is unordered because the low-level handler enqueues faults by
>>> +	 * group. PRI requests within a group have to be ordered, but once
>>> +	 * that's dealt with, the high-level function can handle groups out of
>>> +	 * order.
>>> +	 */
>>> +	queue->wq = alloc_workqueue("iopf_queue/%s", WQ_UNBOUND, 0, name);
>> Should this workqueue use 'WQ_HIGHPRI | WQ_UNBOUND' or some flags like this
>> to decrease the unexpected
>> latency of I/O PageFault here? Or maybe, workqueue will show an uncontrolled
>> latency, even in a busy system.
> I'll investigate the effect of these flags. So far I've only run on
> completely idle systems but it would be interesting to add some
> workqueue-heavy load in my tests.
>
I'm not sure, just my concern. Hopefully, Tejun Heo can give us some 
hints. :)

+cc  Tejun Heo <tj@kernel.org>

Cheers,
Zaibo

.
> .
>


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
