Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5B356CD79
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B138140D;
	Sun, 10 Jul 2022 06:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B138140D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lgsprlJL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfFo0NF_t9SQ; Sun, 10 Jul 2022 06:37:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DC9DB813A4;
	Sun, 10 Jul 2022 06:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC9DB813A4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CA27C0035;
	Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF900C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B96E613BD
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B96E613BD
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lgsprlJL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZ1Pw6dEOG7A for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 16:22:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2F9B60AEF
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2F9B60AEF
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:22:26 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id g4so22772813pgc.1
 for <iommu@lists.linux-foundation.org>; Fri, 08 Jul 2022 09:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pWV5ymtSkb4oQwKzdRG4xc80jYwd1cDXp5Bm9N4oxeU=;
 b=lgsprlJLenV36x7BzHlsJ6RuYTzhtVWR6c2rZUmjfou1L4nqziCaB9xSIYqWa6nFRX
 0O0d/qM/melc8VHoPLmdli5ac2hMIEKbgfAke97M81ew74zkZi7XzKP77ad7gSJKSAPx
 vcV5YqK1X3GV0NW7sqtn3r0e3RX39ahoP+R3WZBs7KEzaq+3MBKOVvOp1C3LKhNoUs9m
 IzejzQhToJ1z5hJtINpcXYyeiXQWxyBlIWw0jq16atTeqasIjB6dNIoJu3Q3kFbB/xmB
 ddagwenJ3y33ANkELLRLEj673/+95ivPrvKFwCLmOXPgwQGxuCQZS1/oB0yLCB4NO8C3
 VYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pWV5ymtSkb4oQwKzdRG4xc80jYwd1cDXp5Bm9N4oxeU=;
 b=LnD8ANCFRLl0CVJXZAXYMZJR8GsIppCVyYuktIbHJiw/UCtl6Uq0Cf4JJX5HJZrdd5
 fZ8ZVe6ZeKQDAgpBAf26ds+ByvrDKVUhDCq8b8e9rz4xHScuQCgxDKIyc/vRBl9rG4vu
 /KdWBH4QUPgvfwteIJtag8XoAQAgPVOEAsQFXGsKxFaZy993x5XpQL3/nDs5lzi4zE6Z
 LsO0T5yvkK4kEqGH2OvXGGozIkIfAqagnTic10TPTTz8/JzzZBBCxtAYQu0xs2JP41BV
 7wQFGc0NbZZZwZWe/s3q7mpZ5u3OjgYSBuD76PqT14Y131fB8RZa3SgArZVZPCSe7xGu
 sp9A==
X-Gm-Message-State: AJIora+gfEmYU32qBOyQG3UL1mPeK0J/s+Bpda2+hAF8L/0d1WCT/a3Q
 chxMyiemfZVfCFpJ2+QZXfY=
X-Google-Smtp-Source: AGRyM1t6XE//mHAuCzTd470VbqGR6fCg+eepzK+JXYrCcmdPEQFGutVuoBUlxtgPhqd4zagmT8qTdg==
X-Received: by 2002:a05:6a00:2404:b0:52a:7fc7:cf57 with SMTP id
 z4-20020a056a00240400b0052a7fc7cf57mr1210092pfh.11.1657297346212; 
 Fri, 08 Jul 2022 09:22:26 -0700 (PDT)
Received: from ?IPV6:2404:f801:10:102:8000::f381? ([2404:f801:8050:3:bf::f381])
 by smtp.gmail.com with ESMTPSA id
 cd21-20020a056a00421500b0051b32c2a5a7sm28761213pfb.138.2022.07.08.09.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 09:22:14 -0700 (PDT)
Message-ID: <fdcf093c-4a42-ddb7-abc6-c595cb92763e@gmail.com>
Date: Sat, 9 Jul 2022 00:21:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3] swiotlb: Split up single swiotlb lock
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <20220707082436.447984-1-ltykernel@gmail.com>
 <YscStPk/IXW9PPmh@infradead.org>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <YscStPk/IXW9PPmh@infradead.org>
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
 vkuznets@redhat.com, kys@microsoft.com, wei.liu@kernel.org,
 Andi Kleen <ak@linux.intel.com>, corbet@lwn.net,
 damien.lemoal@opensource.wdc.com, michael.h.kelley@microsoft.com,
 andi.kleen@intel.com, bp@suse.de, parri.andrea@gmail.com, pmladek@suse.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, keescook@chromium.org,
 paulmck@kernel.org, kirill.shutemov@intel.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, thomas.lendacky@amd.com,
 robin.murphy@arm.com
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

On 7/8/2022 1:07 AM, Christoph Hellwig wrote:
> Thanks, this looks much better.  I think there is a small problem
> with how default_nareas is set - we need to use 0 as the default
> so that an explicit command line value of 1 works.  Als have you
> checked the interaction with swiotlb_adjust_size in detail?

Yes, the patch was tested in the Hyper-V SEV VM which always calls
swiotlb_adjust_size() to adjust bounce buffer size according to memory
size. It will round up bounce buffer size to the next power of 2 if the 
memory size is not power of 2.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
