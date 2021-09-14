Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 496B440AEE7
	for <lists.iommu@lfdr.de>; Tue, 14 Sep 2021 15:29:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B65C1400BF;
	Tue, 14 Sep 2021 13:29:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pP4knF9-o0uQ; Tue, 14 Sep 2021 13:29:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 91CE440359;
	Tue, 14 Sep 2021 13:29:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63E05C000D;
	Tue, 14 Sep 2021 13:29:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F36CEC000D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 13:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0DEF402F4
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 13:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBb_8V2ga4s8 for <iommu@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 13:29:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21087400BF
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 13:29:18 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id i25so24862399lfg.6
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j9vUGQm8IoZhCKNFmiI4S6Is2zu+5YV9tr4eWICr7gE=;
 b=hyvjBRZc51tx6C8lodT1wPEfBnGbEjZlr5JRMIeXOpiDpw7zvSF8MSAbHxiG/A3kRK
 6PNlGKJAieG36HSvsfWH/KLxxRIZ7ueoKi/bnOf/2JAakhjhrC1Oe35yRpcRdmd3f/4W
 nO7pR0eimcsgqk5qFx8dJ1xWuGupZwysHTNDU8IveON6+uDYogDhd4Avga/7NZjSoRMp
 O/iPL8IfEHual5wep8JyYQdkBRoE1YulGTylHGdGz/Lf57EM9z6exBxnsfjC12vF99TF
 mFc+bK+gaCrdOVb4L3pvTLfzLOuAu6yoE3fKogKPb/Hv/f7XMENqudQz8GVOETsovPdi
 eE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j9vUGQm8IoZhCKNFmiI4S6Is2zu+5YV9tr4eWICr7gE=;
 b=GL7V7vQgKmB2MQD/xm24/WthcUkIiv8DVzXKKufyKqc7DexiHSDmaJ5FFUyoCfDnN/
 idtIzAIWPOgdEL9DrSkrQF9KIGRDm9nyzwvcwA7nJzZqA0mZ1jMf9cR/WExrxIgUmpR3
 JpcyouJXm7VEv0BterIsl7nbxlS+w4ak3G1E0vWGi9KvmPtKgVlq5MmB+tG4svRSq1w7
 2wecm1nOQVTKJ/Llx8nfDK6FrATF/PspTfpwUkN4kj0As2+HN5SMM3p6jsJOOJSONUJs
 85dRSzNzTqK7f7oi8UuoQZGKHAgPcVLQORXvJSe9gjtG7uiHD/x6BF+6Z9HXlJL5iWv7
 PFPg==
X-Gm-Message-State: AOAM533PEMqZhT4RNfFwgBRYK0BNNuYC6Pjkq3ystAggdIVWBaOPz4cE
 OCtXmcKMmhjDszkNMnua/dU=
X-Google-Smtp-Source: ABdhPJzSWnhui0lhyAItkS+T+u+WXznhKHZuZaq8qHAIE5Hm2oyM+1zdCRTMGX7y9PV73WwHIM92kA==
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr13120562lfo.689.1631626156958; 
 Tue, 14 Sep 2021 06:29:16 -0700 (PDT)
Received: from [192.168.2.145] (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.googlemail.com with ESMTPSA id b12sm1122236lfb.42.2021.09.14.06.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:29:16 -0700 (PDT)
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to debugfs
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org, will@kernel.org
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <31501a62-3312-9f04-3bb8-790d0481746c@gmail.com>
Date: Tue, 14 Sep 2021 16:29:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914013858.31192-7-nicoleotsuka@gmail.com>
Content-Language: en-US
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jonathanh@nvidia.com
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

MTQuMDkuMjAyMSAwNDozOCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gK3N0YXRpYyB1bnNp
Z25lZCBsb25nIHBkX3B0X2luZGV4X2lvdmEodW5zaWduZWQgaW50IHBkX2luZGV4LCB1bnNpZ25l
ZCBpbnQgcHRfaW5kZXgpCj4gK3sKPiArCXJldHVybiAoKGRtYV9hZGRyX3QpcGRfaW5kZXggJiAo
U01NVV9OVU1fUERFIC0gMSkpIDw8IFNNTVVfUERFX1NISUZUIHwKPiArCSAgICAgICAoKGRtYV9h
ZGRyX3QpcHRfaW5kZXggJiAoU01NVV9OVU1fUFRFIC0gMSkpIDw8IFNNTVVfUFRFX1NISUZUOwo+
ICt9CgpXZSBrbm93IHRoYXQgSU9WQSBpcyBmaXhlZCB0byB1MzIgZm9yIHRoaXMgY29udHJvbGxl
ci4gQ2FuIHdlIGF2b2lkIGFsbAp0aGVzZSBkbWFfYWRkcl90IGNhc3RpbmdzPyBJdCBzaG91bGQg
bWFrZSBjb2RlIGNsZWFuZXIgYSB0YWQsIElNTy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lvbW11
