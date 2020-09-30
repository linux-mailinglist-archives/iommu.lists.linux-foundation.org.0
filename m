Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223D27E03A
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 07:24:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9B1E320424;
	Wed, 30 Sep 2020 05:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9Sy7FPl7WO8; Wed, 30 Sep 2020 05:24:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D4CF520010;
	Wed, 30 Sep 2020 05:24:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFE8CC0051;
	Wed, 30 Sep 2020 05:24:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B9FCC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 57F4720424
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXq5YB8frt0D for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 05:24:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 0703620010
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:24:05 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id w11so603032lfn.2
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 22:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ot3MZsmMh+in5tzB7tORReS9fh89HDHDYfyogfhhys4=;
 b=Uft+bpWGreE5DPXFYxtByJqubq9odg8n0wjA4K1m/WQRVFEAZziEgBjp2pkPluGZd0
 p5WZX5pFp3mkGHxXwAdEuMJJIh8yGUe00P+TAGakxz9zwDlz9LhoYNA4ASNvi8VdMQOc
 tXwX7STTrUZS1kBIEPcKNp0mEBErHNEI3cV6FXLPR7WvGWX9fCZpuGD+fhYCIp1e0aHZ
 B0B1bNpp8w9sHXT+W0ggaYguMdVvP4x2IQDqLJWzJYObFzoZqvD00o9J4w6cDzpQJSQH
 XnC3yMuhVDmrWcjRBqbomi6OMvn/IianJyAQCZujv42RMG0jV2L5vCJVPp20l+aKVm5b
 FlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ot3MZsmMh+in5tzB7tORReS9fh89HDHDYfyogfhhys4=;
 b=Ste9V/3RAqY8DpAHWJia91bBfljkqv5wuwVUjRiaU2DC4YqK2KZT1owsA8oyKrZObd
 QpmwprKJ2ajeVlYq3JmqbAhRXfzof4WurVfQvuuUsHDS6FHUtdm4QHid3OKtmsCapnvP
 QAHY2ZVq8wfWMszvqtlqJ7nBNGAEvK4AmAmW0USwuK53+DZJJmBmOzaFaIiUEjc/6m5C
 jtQ8w5HsX8Kxh9mnuWmVJA7ixf6BalGLaWnW6Ej0G1JRgqSj9OKBeKTipZJFTKkWofYz
 +Evp+J2TwkqazZMZKdHi1L6MeQ/0IZR28+jj+klXGlVpAf+80FXH1AMZ2ufid1ITYfCf
 XPoQ==
X-Gm-Message-State: AOAM531c9miWSdtsqV5I+NNR5BemG+JXlAFkeeYBxHEDo4Qtprv7DzTi
 UDH9TTKWkdz8q4uSnGAt5UE=
X-Google-Smtp-Source: ABdhPJwDBPWzwz3GwxdwEPu+VPyq/at1/Wupik0bBexVWeHa0Xn/PAezWYH+KNyBA/YTIf6gTYQB6w==
X-Received: by 2002:a19:c20b:: with SMTP id l11mr295703lfc.438.1601443443327; 
 Tue, 29 Sep 2020 22:24:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id y25sm50423ljd.79.2020.09.29.22.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 22:24:02 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org, krzk@kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <03710107-b6ad-5256-4550-09c610d0fded@gmail.com>
Date: Wed, 30 Sep 2020 08:24:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930003013.31289-3-nicoleotsuka@gmail.com>
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

MzAuMDkuMjAyMCAwMzozMCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gKwkvKgo+ICsJICog
SU9NTVUgY29yZSBhbGxvd3MgLUVOT0RFViByZXR1cm4gdG8gY2Fycnkgb24uIFNvIGJ5cGFzcyBh
bnkgY2FsbAo+ICsJICogZnJvbSBidXNfc2V0X2lvbW11KCkgZHVyaW5nIHRlZ3JhX3NtbXVfcHJv
YmUoKSwgYXMgYSBkZXZpY2Ugd2lsbAo+ICsJICogY2FsbCBpbiBhZ2FpbiB2aWEgb2ZfaW9tbXVf
Y29uZmlndXJlIHdoZW4gZndzcGVjIGlzIHByZXBhcmVkLgo+ICsJICovCj4gKwlpZiAoIW1jLT5z
bW11IHx8ICFmd3NwZWMgfHwgZndzcGVjLT5vcHMgIT0gJnRlZ3JhX3NtbXVfb3BzKQo+ICAJCXJl
dHVybiBFUlJfUFRSKC1FTk9ERVYpOwoKVGhlICFtYy0+c21tdSBjYW4ndCBiZSB0cnVlLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5n
IGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
