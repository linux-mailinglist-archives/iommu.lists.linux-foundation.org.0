Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1233E258
	for <lists.iommu@lfdr.de>; Wed, 17 Mar 2021 00:50:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92D754304B;
	Tue, 16 Mar 2021 23:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1e-gwqZ7oPcb; Tue, 16 Mar 2021 23:50:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B235141468;
	Tue, 16 Mar 2021 23:50:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95EE9C0010;
	Tue, 16 Mar 2021 23:50:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D16A4C000A
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 23:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AACF44C8F7
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 23:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBCY0l1ZvhtY for <iommu@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 23:50:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A839A474F3
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 23:50:10 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id 20so174809lfj.13
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oXB6+xyPHDZii/8O9jaaLZrloHiccp9uG7TidAIdX0k=;
 b=kRHoWji8jQln8q8Emkhm9fn17e4lS/p8UsvjfB5cvTetb/Da63gDE39WRgw7dvhu1Y
 gy9nj9oRpezB2IaqX5GzqvU2ADGDh4HIKqVzPI4WY7cpZl+FguNoXGiiJaeK8d50sht4
 +w+h2GLqWvKcPGtM2SMGz7s9oNORggO/J2jqjO2PimXt69AEeXMWM0lresu3Jl/eLVEO
 EveER/6JmJfTjne35NEzUHAecHg2u6oiAruMfEs5YZu57FHHmPCgrkc96jOCUCCUF7TQ
 ZQvuHF6AT/9HBL4yYzDXgC+fJWbw/UUPh7Z2EfPix4qSYjWCxJJCxz//DoP99uWiJeVS
 Dv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oXB6+xyPHDZii/8O9jaaLZrloHiccp9uG7TidAIdX0k=;
 b=hS+eP9cbaTI85VU3HVUl1347uFkbZxIy7acEuJBwK2xLemwX76GCHaz1k45Rt5Qk1o
 mjbGeqH0QC397/dVqJQCk0w3Xvj0klyPPAIWfaLSRGply1akhH+xqPJ9AqAfg0ImNglh
 VDpQJNjVUSOea5s41I+/Oi9UfwcmE3uqrFqYtZuXXlyeZNLqjhDvl3uaKNXV/+ew3q8V
 kbIT3i3CrE8XmxItwYADEzO3icUHDiiO+/ktUfKRUAKgOodGLkSxuwdW6d9bvoG47mLz
 idVlXbW6Xqf54QQpZpJiGkYAvJA2UpRgxaAU3CcT5vahMYk0kNmAuX/bGCBPnnGsvzJJ
 eytg==
X-Gm-Message-State: AOAM530cVT/qBiZAzfxRFqQGLJaS2IlQSyYssL0rfu7qQq3p/3V6tCfa
 tkcN1iHXD2OSuafNTYs7134=
X-Google-Smtp-Source: ABdhPJxOjUQ/S1fQWKKSlk4V0vmyKUunbtYbvY0y9KlqnwZngvig7Kfff6LvYs+wNYWkZY8F4UebjQ==
X-Received: by 2002:a05:6512:3709:: with SMTP id
 z9mr628448lfr.557.1615938608636; 
 Tue, 16 Mar 2021 16:50:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id g21sm3170038lfr.212.2021.03.16.16.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:50:08 -0700 (PDT)
Subject: Re: [PATCH v5] iommu/tegra-smmu: Add pagetable mappings to debugfs
To: Thierry Reding <thierry.reding@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210315203631.24990-1-nicoleotsuka@gmail.com>
 <YFCTmwpg9pMQqcSu@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d338d407-8e0a-a94a-dcff-80556174492e@gmail.com>
Date: Wed, 17 Mar 2021 02:50:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFCTmwpg9pMQqcSu@orome.fritz.box>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, will@kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

MTYuMDMuMjAyMSAxNDoxNiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4gKwlzZXFfcHV0
cyhzLCAifVxuIik7Cj4+ICsJc2VxX3ByaW50ZihzLCAiVG90YWwgUERFIGNvdW50OiAldVxuIiwg
cGRlX2NvdW50KTsKPj4gKwlzZXFfcHJpbnRmKHMsICJUb3RhbCBQVEUgY291bnQ6ICVsbHVcbiIs
IHB0ZV9jb3VudCk7Cj4gU29tZSBvZiB0aGUgYWJvdmUgbG9va3MgbGlrZSBpdCB3b3VsZG4ndCBi
ZSB2ZXJ5IGVhc2lseSBjb25zdW1lZCBieQo+IHNjcmlwdHMuIElzIHRoYXQgc29tZXRoaW5nIHdl
IHdhbnQgdG8gZG8/IE9yIGlzIHRoaXMgdGFyZ2V0dGVkIHByaW1hcmlseQo+IGF0IGh1bWFuIGNv
bnN1bXB0aW9uPwoKT3V0cHV0IHNob3VsZCBiZSBwYXJzYWJsZSB1c2luZyBhIHNpbXBsZSByZWdl
eC4gQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5CndoYXQgZXhhY3RseSBpc24ndCBlYXN5PwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5n
IGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
