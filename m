Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C793C1557
	for <lists.iommu@lfdr.de>; Thu,  8 Jul 2021 16:40:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D19D983C19;
	Thu,  8 Jul 2021 14:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTNI4zY1O05x; Thu,  8 Jul 2021 14:40:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 057EC83C0D;
	Thu,  8 Jul 2021 14:40:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E047FC001D;
	Thu,  8 Jul 2021 14:40:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3A5EC000E
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 14:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3D0C41D0C
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 14:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w25G3F-ujZOG for <iommu@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 14:40:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1665E41D07
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 14:40:40 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id f5so6171672pgv.3
 for <iommu@lists.linux-foundation.org>; Thu, 08 Jul 2021 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YXjZj7OhvPZJaAtT6Qwq7/8ZjjZCmfNtMSr8qDj8MRU=;
 b=ayW8QQM2efuvpdH0iOtsj9sDatgzjNkhl4+y/ouwe04BZcpt7tSpZSztZE1HcOshdP
 QXaUNAf/1sngsBP+5ZL0dubNDykY4vKK6b9Wmf6V3NS5iLDuzZvWuWys1GP5fH3k/OTC
 tYDRBkngjXQYqPF3DQewzYEvp4aC50Y/xFZW27B7I7FoSeruMrEakyjTyq4nU9lq5OXG
 9pEOEVcjBjM/2JuAGoOCNl8yharry3mPga7LZqh8ptcnsE3cQjXBDpSs+J18TjrzoZin
 UJfMRAaQiH9cX09/xDZhBpWcjIM9jra7EdcFVO0s5QSQNR3e2+qLq6ocQLn3NXgEDy83
 /jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YXjZj7OhvPZJaAtT6Qwq7/8ZjjZCmfNtMSr8qDj8MRU=;
 b=aOc8wnd6nmXOq94Og7fRMhMv4froRgK3wRKfFr6GjR4U4jTJp4z3n6BcRfxhb2J/c3
 QNP2w+o6xZVdRN//SJTxSFwaO9a6FyUH4HNl86fwKR83Hk0U7haBx3MPAbDcWAkT9rLL
 xTK3Plq/ygn6xMApPQUITYFVbYt2ciiDZqAoTEoSqE1B0AE/YFLNmyxI9+mwqfDeuEQO
 LP1zXWw5dWqLZsAZEo4vWVNPTsZL4+/kaejr1YkYbm7KrvY+r2+SlgJMSDXTjcltDssx
 ioEhLeoqgobgf5sC+DNUV4btwGzw9weJ+OCRPezSf4/1sKlwGD5iHbi1AFs5W8g+Xpvd
 Bl8Q==
X-Gm-Message-State: AOAM530YdA2swcOL9OCh9NJj/YZJdeeLXUTtj4nS4AMDdpL3PR5ZZZNO
 3/ob5rqIQaz6fASsTP1IQwY=
X-Google-Smtp-Source: ABdhPJwsdOgUCGltloBXaOdJeRrQgvHkqG47NpBLcd9gNcAJ5PSk2V3aVVR6tD13omBoKJiA4S0mBQ==
X-Received: by 2002:aa7:818a:0:b029:309:a073:51cb with SMTP id
 g10-20020aa7818a0000b0290309a07351cbmr31830476pfi.40.1625755240540; 
 Thu, 08 Jul 2021 07:40:40 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:18:efec::4b1])
 by smtp.gmail.com with ESMTPSA id
 h20sm3216729pfn.173.2021.07.08.07.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 07:40:39 -0700 (PDT)
Subject: Re: [RFC PATCH V4 01/12] x86/HV: Initialize shared memory boundary in
 the Isolation VM.
To: Olaf Hering <olaf@aepfle.de>
References: <20210707153456.3976348-1-ltykernel@gmail.com>
 <20210707153456.3976348-2-ltykernel@gmail.com>
 <20210708073400.GA28528@aepfle.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <9b5d6843-67c5-066e-0997-995ec77e06b2@gmail.com>
Date: Thu, 8 Jul 2021 22:40:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708073400.GA28528@aepfle.de>
Content-Language: en-US
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, peterz@infradead.org,
 dave.hansen@linux.intel.com, hpa@zytor.com, anparri@microsoft.com,
 kys@microsoft.com, will@kernel.org, boris.ostrovsky@oracle.com,
 linux-arch@vger.kernel.org, robh@kernel.org, wei.liu@kernel.org,
 sstabellini@kernel.org, sthemmin@microsoft.com, xen-devel@lists.xenproject.org,
 linux-scsi@vger.kernel.org, x86@kernel.org, decui@microsoft.com, hch@lst.de,
 michael.h.kelley@microsoft.com, nramas@linux.microsoft.com, mingo@redhat.com,
 pgonda@google.com, rientjes@google.com, kuba@kernel.org, jejb@linux.ibm.com,
 martin.b.radev@gmail.com, thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
 keescook@chromium.org, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, tj@kernel.org, bp@alien8.de, luto@kernel.org,
 krish.sadhukhan@oracle.com, tglx@linutronix.de, vkuznets@redhat.com,
 jgross@suse.com, martin.petersen@oracle.com, saravanand@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kirill.shutemov@linux.intel.com,
 hannes@cmpxchg.org, ardb@kernel.org, akpm@linux-foundation.org,
 robin.murphy@arm.com, davem@davemloft.net, rppt@kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGkgT2xhZjoKCk9uIDcvOC8yMDIxIDM6MzQgUE0sIE9sYWYgSGVyaW5nIHdyb3RlOgo+IE9uIFdl
ZCwgSnVsIDA3LCBUaWFueXUgTGFuIHdyb3RlOgo+IAo+PiArKysgYi9pbmNsdWRlL2FzbS1nZW5l
cmljL21zaHlwZXJ2LmgKPj4gQEAgLTM0LDggKzM0LDE4IEBAIHN0cnVjdCBtc19oeXBlcnZfaW5m
byB7Cj4gCj4+ICAgCXZvaWQgIF9fcGVyY3B1ICoqZ2hjYl9iYXNlOwo+IAo+IEl0IHdvdWxkIGJl
IGNvb2wgaWYgdGhlIGNvdmVyIGxldHRlciBzdGF0ZXMgd2hpY2ggY29tbWl0IGlkIHRoaXMgc2Vy
aWVzIGlzIGJhc2VkIG9uLgoKVGhhbmtzIGZvciB5b3VyIHJlbWluZGVyLiBJIHdpbGwgYWRkIHRo
aXMgaW4gdGhlIGxhdGVyIHZlcnNpb24uClRoaXMgcGF0Y2hzZXQgaXMgcmViYXNlZCBvbiBIeXBl
ci1WIG5leHQgYnJhbmNoIHdpdGggU3dpb3RsYiAK4oCcUmVzdHJpY3RlZCBETUHigJwgcGF0Y2hl
cyBmcm9tIENsYWlyZSBDaGFuZyA8dGllbnR6dUBjaHJvbWl1bS5vcmc+CiAKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIxMDYyNDE1NTUyNi4yNzc1ODYzLTEtdGllbnR6dUBjaHJvbWl1
bS5vcmcvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlv
bW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
