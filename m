Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5F221D47
	for <lists.iommu@lfdr.de>; Thu, 16 Jul 2020 09:25:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C54A8A51D;
	Thu, 16 Jul 2020 07:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUyodWkCCEVG; Thu, 16 Jul 2020 07:25:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9E4C18A52F;
	Thu, 16 Jul 2020 07:25:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8993DC0733;
	Thu, 16 Jul 2020 07:25:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC9DAC0733
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 07:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C5AB38A519
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 07:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 967x1npOOEHV for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 07:25:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5DF4A8867F
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 07:25:02 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id e4so6001428ljn.4
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iwWRMO4k+W7lJrGwJ6PHZuZwqQtagZ/HD1fwTfYKovY=;
 b=iThWgF7429hYsYc4qRTjSRex2kqbLsyLFpMP2MZn9vGSLoqoJxFfTPHkXy3X4h1yNO
 wMz1ItZrgKBpe7X5PMDM4myu4rrmCQjBEjRGT5S7BwY5oHsi0Guvhf6UbuJJcopsQB7b
 OGYSi5XHeVBvtqJtMdhjgcvHv/TwUTYAbR3bnLbJ6hPEsCuHnhOwU3PgVSMjVTh75xaf
 AeCTv9c2vFTB92HqSTh1fztxT5IsXbKt0ZQfFS3lRIjiAeDY1ZHreovLQH6JDLDXGQdD
 c0wFuKYAiUNdlMGde+goFWD2217kTFZADR6xebf6pPZir0X6sz8/C6bZbzz3ICzSFyOd
 ye1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iwWRMO4k+W7lJrGwJ6PHZuZwqQtagZ/HD1fwTfYKovY=;
 b=A/wbt4tjkoEq0RE6qTMYAIduMz7MhymK1sU1v11zvhsn/hw4KCSYwXQwYPrWx1zp2Q
 5erZ6XC4Dlv0S9Sjl+R5/bYPErBo4xEmPXJDRHSRNhD3mndozEoD4vjjxAdvvUnmtRjn
 63GWWI5BGi+QhcXg3Z9KhUgOW9S6sc4X8z0yR4kjC9c4GvG8WkxbS8FzstusJ15XFG/+
 RrfzTR+LiC9Ljh0JNFKymNx43wBXz7gH6uc/EYpo2XevtZWu1D+3KXCaJhiQmLaobtfX
 ui8agjy5YedapeSqmc73Ddg/6Dux/jrvXnDiELlzg/c+HE5La6i1is0ViJgdq9hLxCoF
 1nZA==
X-Gm-Message-State: AOAM531x+weu2J/psDMR/Nb3B/xDdsn6zaYbkJQwXBqymvMeJwqoHm0n
 HpSTxNyPy7QXCFdva/yLRumJBA==
X-Google-Smtp-Source: ABdhPJxzkaMOt17VDa5ZtlEX2xqBMWiE7KrO334rqTYiE7Kn0Ybp1ROEMzXevSBfAY/ipqVHatFG1Q==
X-Received: by 2002:a05:651c:1a7:: with SMTP id
 c7mr1396061ljn.345.1594884300536; 
 Thu, 16 Jul 2020 00:25:00 -0700 (PDT)
Received: from [192.168.1.9] ([83.68.95.66])
 by smtp.googlemail.com with ESMTPSA id f13sm1003407lfs.29.2020.07.16.00.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2020 00:24:59 -0700 (PDT)
Subject: Re: [PATCH v4 2/4] iommu/arm-smmu: Workaround for Marvell
 Armada-AP806 SoC erratum #582743
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, joro@8bytes.org,
 gregory.clement@bootlin.com, robh+dt@kernel.org, hannah@marvell.com
References: <20200715070649.18733-1-tn@semihalf.com>
 <20200715070649.18733-3-tn@semihalf.com>
 <793ede4d-79e9-3615-9da1-57cfe1a44c4d@arm.com>
From: Tomasz Nowicki <tn@semihalf.com>
Message-ID: <5728f570-b3e5-63fe-9d59-768831943fef@semihalf.com>
Date: Thu, 16 Jul 2020 09:24:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <793ede4d-79e9-3615-9da1-57cfe1a44c4d@arm.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, nadavh@marvell.com,
 iommu@lists.linux-foundation.org, mw@semihalf.com,
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

On 15.07.2020 12:32, Robin Murphy wrote:
> On 2020-07-15 08:06, Tomasz Nowicki wrote:
>> From: Hanna Hawa <hannah@marvell.com>
>>
>> Due to erratum #582743, the Marvell Armada-AP806 can't access 64bit to
>> ARM SMMUv2 registers.
>>
>> Provide implementation relevant hooks:
>> - split the writeq/readq to two accesses of writel/readl.
>> - mask the MMU_IDR2.PTFSv8 fields to not use AArch64 format (but
>> only AARCH32_L) since with AArch64 format 32 bits access is not 
>> supported.
>>
>> Note that most 64-bit registers like TTBRn can be accessed as two 32-bit
>> halves without issue, and AArch32 format ensures that the register writes
>> which must be atomic (for TLBI etc.) need only be 32-bit.
> 
> Thanks Tomasz, this has ended up as clean as I'd hoped it could, and 
> there's still room to come back and play more complicated games later if 
> a real need for AARCH64_64K at stage 2 crops up.

Based on your implementation infrastructure rework, indeed the code 
looks much cleaner :)

> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 

Thanks!

Tomasz
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
