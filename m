Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3782814F4
	for <lists.iommu@lfdr.de>; Fri,  2 Oct 2020 16:22:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C601886C73;
	Fri,  2 Oct 2020 14:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIf07SQNlwfs; Fri,  2 Oct 2020 14:22:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3EBD586C71;
	Fri,  2 Oct 2020 14:22:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34629C0051;
	Fri,  2 Oct 2020 14:22:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0583CC0051
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E8EA386C71
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZpBGNxNokkv for <iommu@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 14:22:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1657B86C70
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:22:44 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id x69so2084375lff.3
 for <iommu@lists.linux-foundation.org>; Fri, 02 Oct 2020 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8PpHqO+OTs0E0egHq3QrOMDpgYOfO6HQTLXz2o3ta2Y=;
 b=Na/t7KEirUUI/kEktEVwqr6PJ1OPUtBlWi1T6fDHlbeuagh7zkbMYg2gBAEbHR066D
 2wLzUfdHaxkh1qZYZUeHXhX5zd+B1Bn5YFk82T/bzDTOm2LPUh4ejZvOiGB/T1onl+Vg
 Ay0tUiebdAgCO9IQ3fYzICBDXecxFODJ5NybRf8v6KiASsjGrZ88JTGblZMYC7xPX1iU
 O0utZmj3tnpjuIiZX6YeJ/gZGfN8rMehTnLqKK1G8NdUaZrBjUShcnIeeDn8KRpw283g
 dHVGF+fiWdsQBGjPx0gIW6I9nCe99S7k98t/VEhaq0cI/urkP4xMFNl2WNoGew0jVN32
 zWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8PpHqO+OTs0E0egHq3QrOMDpgYOfO6HQTLXz2o3ta2Y=;
 b=WNp0gHDXMw1szgW0i2F7aidJ3Qe+7m0Y8A6X1kTJ66E78omATnJql+sNkY4rhMXXvz
 gCjUOGVF4dCFBKFlHxz5zlCLX3UYS9h0b6wp5XcTqehzleEg2UH3gNaBKLAnzE9a+FHo
 pQt6YvxT723Y0L09W7UpCSx4UdeZfsatgw+em1ss32lbSXRwDDhIiY5gpHukjavjIyGj
 /mzrfcEEBXEcLAZoXanw3tLuNYCrRLG0QGDZB7g8CttvPuXZOW5c0Y/s3VYe06JgoYev
 vBLx1FIsgHCYZ68YNUfGemfML9v7DN+pGGM7CRl0oTp6rJby/49xXe2uzJabSj85w76I
 rDtg==
X-Gm-Message-State: AOAM530oRfJBO81EXJ/FlWY8qHSEdzfHAteEdUIfNC2EYjwMdIYPOnx1
 AnGqZPJawNEET3yezwDl/vin0VAuJsI=
X-Google-Smtp-Source: ABdhPJzROLRfb/tKFALlhopua1rVZr0C+e1zGBUzkVUxywn6lViZMGoxABsTqgJnKBejrlcFzN8QDg==
X-Received: by 2002:a19:84ca:: with SMTP id g193mr960092lfd.85.1601648562338; 
 Fri, 02 Oct 2020 07:22:42 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru.
 [109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id k21sm251450ljb.43.2020.10.02.07.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 07:22:41 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
Date: Fri, 2 Oct 2020 17:22:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002060807.32138-3-nicoleotsuka@gmail.com>
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

MDIuMTAuMjAyMCAwOTowOCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gIHN0YXRpYyBpbnQg
dGVncmFfc21tdV9vZl94bGF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAkJCSAgICAgICBzdHJ1
Y3Qgb2ZfcGhhbmRsZV9hcmdzICphcmdzKQo+ICB7Cj4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICppb21tdV9wZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShhcmdzLT5ucCk7Cj4gKwlzdHJ1
Y3QgdGVncmFfbWMgKm1jID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoaW9tbXVfcGRldik7Cj4gIAl1
MzIgaWQgPSBhcmdzLT5hcmdzWzBdOwo+ICAKPiArCW9mX25vZGVfcHV0KGFyZ3MtPm5wKTsKPiAr
Cj4gKwlpZiAoIW1jIHx8ICFtYy0+c21tdSkKPiArCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKCnBs
YXRmb3JtX2dldF9kcnZkYXRhKE5VTEwpIHdpbGwgY3Jhc2guCgo+ICsJZGV2X2lvbW11X3ByaXZf
c2V0KGRldiwgbWMtPnNtbXUpOwoKSSB0aGluayBwdXRfZGV2aWNlKG1jLT5kZXYpIGlzIG1pc3Nl
ZCBoZXJlLCBkb2Vzbid0IGl0PwoKV2h5IHN1bjUwaS1pb21tdSBkcml2ZXIgZG9lc24ndCBoYXZl
IHRoaXMgZXJyb3ItY2hlY2tpbmc/IElzIGl0IHJlYWxseQpuZWVkZWQgYXQgYWxsPwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxp
c3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
