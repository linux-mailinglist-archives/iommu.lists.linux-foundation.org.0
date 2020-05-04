Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E523D1C3CE9
	for <lists.iommu@lfdr.de>; Mon,  4 May 2020 16:25:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9546387E81;
	Mon,  4 May 2020 14:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAZXtvhGAR4d; Mon,  4 May 2020 14:25:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 31BDD87D86;
	Mon,  4 May 2020 14:25:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16EAAC0175;
	Mon,  4 May 2020 14:25:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1238DC0175
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 14:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0104D88026
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 14:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbzupgKrvSyo for <iommu@lists.linux-foundation.org>;
 Mon,  4 May 2020 14:24:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9E12288002
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 14:24:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f13so21138065wrm.13
 for <iommu@lists.linux-foundation.org>; Mon, 04 May 2020 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oDFjMogrrxgfBvAbW5sQ85zZf2koPdX/flvpXuarsJs=;
 b=C2+pDEOsEWMWEhK5jJihq+nZJsN3eyEZTYqrjm8F+NX2U4UWxWT4bq3TAe4s6ccpAF
 +4sas0ALldd+rEORJx5lpswwArDb/7j7znthws10FOtWqFllviOYtjS1sgR01+uhjhSg
 UTcE7cHgEzLdbISPHhOxFiqWLpJzCQ1DRIUt4NlbeOv0R8e703LNhYb26kTHr9YaAaOc
 proIbDywAmUaxtjcMFXJUCVdUFnCQGQjanr6hd0+FW3YkN2pevahT++dZrNrh8UlKt8/
 Zpd1vSYA8JKyL8SjQQTI8NGfT8GjDltQ3FbhARNC21VzGwv16zunILQ502YxBkFLEGBu
 UDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oDFjMogrrxgfBvAbW5sQ85zZf2koPdX/flvpXuarsJs=;
 b=FeM8gwdjLozsO8GltlXfZPAGIO8F7R8xecNw64AvuoUbqTzqhAelmEHU8vXmItNtq9
 +89g/Z8zwwuzXnnj4rnz9mqzyIDznjJtdW8yd1BjXamdX9MmFyoaX3y8lxQ36jquKf8f
 5NI/+BqCUpjozdjvP/8GPHpEW1HFmLl5mA4TrX4ZdkNK3bah5ZDv5s5t9ynzFarAuerv
 n+h2+V3fUdi6/9kfFXq4wDAbZAt7KGykrkNjyaFppnolnjqGPzw16CTUI7v3teYGlcLR
 SISpiYrQ9HfMqyJja/xQBJfvxB55Qh2RNc6hCiQ8rsVFLlEja4lyFf/KtEJX8TYO5TD6
 JjTA==
X-Gm-Message-State: AGi0PuamC57GLyOURdNCvoUw7XUe9z22R2f0by2oEGAj83kQfQUHvTtE
 C4e6nh65k4hygtES+Kw5mt6GTFbc48en8qLX89k=
X-Google-Smtp-Source: APiQypLGjILvGQo1LHKs+cUl/os48PmLVkMiBpNAewY+5+4GJJUXgPIlfOPn4hI9IzydhWXXgPlj9fp5HqE+FI7JLCY=
X-Received: by 2002:adf:ed82:: with SMTP id c2mr8123328wro.255.1588602280048; 
 Mon, 04 May 2020 07:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-20-jean-philippe@linaro.org>
In-Reply-To: <20200430143424.2787566-20-jean-philippe@linaro.org>
From: Prabhakar Kushwaha <prabhakar.pkin@gmail.com>
Date: Mon, 4 May 2020 19:54:03 +0530
Message-ID: <CAJ2QiJLUxiJRnxQmO3O_48ZcTtNwziCWT6i2SJdAruDi+KGEFw@mail.gmail.com>
Subject: Re: [PATCH v6 19/25] iommu/arm-smmu-v3: Add support for Hardware
 Translation Table Update
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
X-Mailman-Approved-At: Mon, 04 May 2020 14:25:43 +0000
Cc: fenghua.yu@intel.com, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>,
 Ganapatrao Prabhakerrao Kulkarni <gkulkarni@marvell.com>, hch@infradead.org,
 jgg@ziepe.ca, tanmay@marvell.com, Catalin Marinas <catalin.marinas@arm.com>,
 zhangfei.gao@linaro.org, devicetree@vger.kernel.org, kevin.tian@intel.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 felix.kuehling@amd.com, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, christian.koenig@amd.com
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

Dear Jean,

On Thu, Apr 30, 2020 at 8:11 PM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> If the SMMU supports it and the kernel was built with HTTU support, enable

is there any framework/config for HTTU which must be enabled to use this patch?


> We can enable HTTU even if CPUs don't support it, because the kernel
> always checks for HW dirty bit and updates the PTE flags atomically.
>
I believe, this statement is valid in context of this patch-set only.

One cannot use code snipped to test HTTU because exiting
io-pgtable-arm.c driver doesn't have framework to leverage HTTU
benfits. It by-default sets AF=1 and does not set DBM.

Thanks

--pk
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
