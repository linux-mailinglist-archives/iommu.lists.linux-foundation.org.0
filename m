Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0A2815C2
	for <lists.iommu@lfdr.de>; Fri,  2 Oct 2020 16:50:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7F37220485;
	Fri,  2 Oct 2020 14:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tGUlc7neLMA; Fri,  2 Oct 2020 14:50:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3EEED27384;
	Fri,  2 Oct 2020 14:50:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E0AEC0895;
	Fri,  2 Oct 2020 14:50:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED5BEC0051
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3EF2287392
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4A7qU87OlFMO for <iommu@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 14:50:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A2FE487390
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:50:11 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id c2so1396153ljj.12
 for <iommu@lists.linux-foundation.org>; Fri, 02 Oct 2020 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=icdFDe/cdsShYJe56p6ssMuQsoQOC58YVV62WDTMBW0=;
 b=YUYEjVJXtGilO0I8BpRRXsmf/EUah8NX57KAzvzCVZWt4cW/TYEg6cXA6MeepCZqa1
 u7ArwvnsYG5IHazbc0HXlIRzqdMhLTSzQogC1xPoVqYONsYzIdv50SdeOARAqaSgqxCY
 Bynav+aQx+Ap1Ec+5VUTEgy22ZeTP2UKNaerL38fCN6owZ3/B/daCiGm8AYhvqo8ahAl
 lYmTCSeNUvUl06fQ/M6ehFLykpnGnCj+xlDd/0OPXO8BD7QVE4CGk0lB2YOlYVgb05vW
 uh5qxI0SpwVzr+pHGy+5BLCIb8NkLdlKsjVWYxrwPpwRKSaksBPIm0cCi1yCjMXrSJwh
 mcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=icdFDe/cdsShYJe56p6ssMuQsoQOC58YVV62WDTMBW0=;
 b=ZrCMd0DknrivPevQtsx5afKnw4cg+svIOnuw5o+tfyscRKX8rcaf8KwguQUFh1jOjo
 sb1WKGoItiGdM2ldESmkcdbJXw4rsw9cO9DQJ8ULLV2LK4sg54NnTCdeq/UpXUsl3jqh
 s/qf2ciQv5n5c3FkPXie00kn2n4y/IABRJWEUbgc+LEDZPuv5teeic12RthM7SnBlupK
 RaDaDRhZL92CkkXaErsX44muJ5P1UR3kAgjNgIReMvDNfGG6GZKZBAak8FzYE7hLD/E4
 wRAw4DB6bFW+J+Q905gaQQfWf8CXUYL44JHfHaJSTwnWRLAfHraZjod22cB3EkSIapkV
 lwfA==
X-Gm-Message-State: AOAM531r/xOTBVzvcZsk5NpfwjMxgnWlJTso4bK1VRpea3CNkDF6Qk5R
 wuZg/JStfyVY2G7c9MXymNU=
X-Google-Smtp-Source: ABdhPJzk76ag8TT9nnz/AUf2dbIh1ndd+Rk83HU3cBelCn557Nxb5dCa1QoNUEh8XhIU/rPZ77bbaA==
X-Received: by 2002:a05:651c:1397:: with SMTP id
 k23mr907389ljb.263.1601650209915; 
 Fri, 02 Oct 2020 07:50:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru.
 [109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id u20sm326506lfo.156.2020.10.02.07.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 07:50:09 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
From: Dmitry Osipenko <digetx@gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
Message-ID: <0c66bab9-0132-d3fb-ea4e-de1278cf2b04@gmail.com>
Date: Fri, 2 Oct 2020 17:50:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
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

MDIuMTAuMjAyMCAxNzoyMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+ICBzdGF0aWMg
aW50IHRlZ3JhX3NtbXVfb2ZfeGxhdGUoc3RydWN0IGRldmljZSAqZGV2LAo+PiAgCQkJICAgICAg
IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmFyZ3MpCj4+ICB7Cj4+ICsJc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqaW9tbXVfcGRldiA9IG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUoYXJncy0+bnApOwo+
PiArCXN0cnVjdCB0ZWdyYV9tYyAqbWMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShpb21tdV9wZGV2
KTsKPj4gIAl1MzIgaWQgPSBhcmdzLT5hcmdzWzBdOwo+PiAgCj4+ICsJb2Zfbm9kZV9wdXQoYXJn
cy0+bnApOwo+PiArCj4+ICsJaWYgKCFtYyB8fCAhbWMtPnNtbXUpCj4+ICsJCXJldHVybiAtRVBS
T0JFX0RFRkVSOwo+IHBsYXRmb3JtX2dldF9kcnZkYXRhKE5VTEwpIHdpbGwgY3Jhc2guCj4gCgpB
Y3R1YWxseSwgcGxhdGZvcm1fZ2V0X2RydmRhdGEoTlVMTCkgY2FuJ3QgaGFwcGVuLiBJIG92ZXJs
b29rZWQgdGhpcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
