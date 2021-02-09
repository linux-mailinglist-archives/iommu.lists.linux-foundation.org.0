Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819D314B82
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 10:27:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0A0E8737E;
	Tue,  9 Feb 2021 09:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpeX6aAc+V6A; Tue,  9 Feb 2021 09:27:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E124C86B05;
	Tue,  9 Feb 2021 09:27:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5BF1C013A;
	Tue,  9 Feb 2021 09:27:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D232C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 09:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 721C786B05
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 09:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqVQiQyU84mk for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 09:27:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7D617873C0
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 09:27:46 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DZcvp1gvBz7jFf;
 Tue,  9 Feb 2021 17:26:14 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.87) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Tue, 9 Feb 2021
 17:27:31 +0800
Subject: Re: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory pin
To: Arnd Bergmann <arnd@kernel.org>
References: <1612685884-19514-1-git-send-email-wangzhou1@hisilicon.com>
 <1612685884-19514-2-git-send-email-wangzhou1@hisilicon.com>
 <CAK8P3a13aGbqvTxL+5OQxu-wPa6RDHQJkJ_n8O6YeOibbJQ2yg@mail.gmail.com>
From: Zhou Wang <wangzhou1@hisilicon.com>
Message-ID: <753db746-292c-4f1d-c79f-9a7282a19ba2@hisilicon.com>
Date: Tue, 9 Feb 2021 17:27:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a13aGbqvTxL+5OQxu-wPa6RDHQJkJ_n8O6YeOibbJQ2yg@mail.gmail.com>
X-Originating-IP: [10.40.188.87]
X-CFilter-Loop: Reflected
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 Sihang Chen <chensihang1@hisilicon.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux API <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, "open
 list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, gregkh <gregkh@linuxfoundation.org>,
 Zhangfei Gao <zhangfei.gao@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On 2021/2/8 5:51, Arnd Bergmann wrote:
> On Sun, Feb 7, 2021 at 9:18 AM Zhou Wang <wangzhou1@hisilicon.com> wrote:
> 
>> diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
>> index cccfbbe..3f49529 100644
>> --- a/arch/arm64/include/asm/unistd32.h
>> +++ b/arch/arm64/include/asm/unistd32.h
>> @@ -891,6 +891,8 @@ __SYSCALL(__NR_faccessat2, sys_faccessat2)
>>  __SYSCALL(__NR_process_madvise, sys_process_madvise)
>>  #define __NR_epoll_pwait2 441
>>  __SYSCALL(__NR_epoll_pwait2, compat_sys_epoll_pwait2)
>> +#define __NR_mempinfd 442
>> +__SYSCALL(__NR_mempinfd, sys_mempinfd)
> 
> This adds a compat syscall for 32-bit tasks running on arm64 without adding
> the same for the native arch/arm syscall table. Those two need to always
> stay synchronized. In fact, new system call should ideally get assigned
> on all architectures at the same time, with the same number (or +110
> on arch/alpha).

Thank for pointing out this. I use an ARM64 machine to test, so
currently only add it for ARM64 :)

Best,
Zhou

> 
>          Arnd
> 
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
