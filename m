Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3A282473
	for <lists.iommu@lfdr.de>; Sat,  3 Oct 2020 16:06:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2AA7520377;
	Sat,  3 Oct 2020 14:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ao2w1NgTEM6U; Sat,  3 Oct 2020 14:06:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 55799203F6;
	Sat,  3 Oct 2020 14:06:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D027C0051;
	Sat,  3 Oct 2020 14:06:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1406BC0051
 for <iommu@lists.linux-foundation.org>; Sat,  3 Oct 2020 14:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F2B6120377
 for <iommu@lists.linux-foundation.org>; Sat,  3 Oct 2020 14:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FXx8jO-fPy6 for <iommu@lists.linux-foundation.org>;
 Sat,  3 Oct 2020 14:06:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by silver.osuosl.org (Postfix) with ESMTPS id B533D203F6
 for <iommu@lists.linux-foundation.org>; Sat,  3 Oct 2020 14:06:45 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 197so5398356lfo.11
 for <iommu@lists.linux-foundation.org>; Sat, 03 Oct 2020 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bx6Er5n5mhxYHHvURjb1uunhMDfSLBADFm1BcHlIQrU=;
 b=vPOk1EugRygidJMpN+/VQXyMhf/gszfPk2s+HuTMM/d0NvZr4eCvRaBuoUXqxf1AOG
 HAmoBdUOpTvTA1jk4DbOUJau1pIdx3pVwVuMJ7vAAgj+/P+R9aMi9lx5M58vCOHR6+Xk
 IvayIB8OANtfFY2sIPdem5LnyJNAQBjCJZuKmzt2lrWnUSl1l/GG4MDwKFws1Qg+DezI
 dDWVl98np/7r3xkKfIdVuTmxwbEB0/v0342grgnOyf+BNqQWUk+QCdFnlUH/WzfDCklS
 S97PqpcJ7+GWZiTnIjURp/iyM2aAjIGNQxmzjQOFuVIr4QEebB9FKxsXnMvS1UekcDsz
 xUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bx6Er5n5mhxYHHvURjb1uunhMDfSLBADFm1BcHlIQrU=;
 b=nHXMZadOe7h/7Yxt4+D0pscz/1B2Wt+WefqgEbnwBTLCaBfjk/q3qYfJ+JtJFBCxB0
 tjrtY+uUszFSlbTrGX8z/xjBJ6nPyAtaHd+vW3S8SfLuuHNcBgcslVTeOzr+GJZrpRv/
 VcgzfSIvTWi1NTTOvgjZpL63MjOwSHZvKWYLsRfIyvHpJSmm6/kfr+mF8c948Y4gCfaJ
 ZD2U1CqrhWD24wMQOPBzNb3YZNn+59XFJLeHEpAH6s985IFeFriQM8yeOtoKfsXUaa2H
 /Uy8RNQL860W7xRmbox9qOQA8KG2RYKwEbh8I/fU88wtCM/p/JKHcrkcfm2o1/XBw3ff
 s2Dg==
X-Gm-Message-State: AOAM531e+2PYLXmYr0PXGcMEtWb7sScNeWcI1U9atOs0P0uIeAQJYDZR
 DGI0JlntjLjI+mvrMjJpPsA=
X-Google-Smtp-Source: ABdhPJzRjghQrvv/1QRYHrh7udF6gDxgv2wE+pcaClW4SpwZsyNRY8gl9G7Xb/voZ/Cb/jHHj5Yxhw==
X-Received: by 2002:a19:2214:: with SMTP id i20mr2839812lfi.252.1601734003842; 
 Sat, 03 Oct 2020 07:06:43 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru.
 [109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id q17sm1518034lfd.37.2020.10.03.07.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 07:06:43 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4a5a5b1c-080a-327a-1e2f-dc087948e1a1@gmail.com>
Date: Sat, 3 Oct 2020 17:06:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201003065947.18671-3-nicoleotsuka@gmail.com>
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

MDMuMTAuMjAyMCAwOTo1OSwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gIHN0YXRpYyBpbnQg
dGVncmFfc21tdV9vZl94bGF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAkJCSAgICAgICBzdHJ1
Y3Qgb2ZfcGhhbmRsZV9hcmdzICphcmdzKQo+ICB7Cj4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICppb21tdV9wZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShhcmdzLT5ucCk7Cj4gKwlzdHJ1
Y3QgdGVncmFfbWMgKm1jID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoaW9tbXVfcGRldik7Cj4gIAl1
MzIgaWQgPSBhcmdzLT5hcmdzWzBdOwo+ICAKPiArCXB1dF9kZXZpY2UoJmlvbW11X3BkZXYtPmRl
dik7Cj4gKwo+ICsJaWYgKCFtYyB8fCAhbWMtPnNtbXUpCj4gKwkJcmV0dXJuIC1FUFJPQkVfREVG
RVI7CgpJJ20gbm90IHZlcnkgZXhjaXRlZCBieSBzZWVpbmcgY29kZSBpbiB0aGUgcGF0Y2hlcyB0
aGF0IGNhbid0IGJlCmV4cGxhaW5lZCBieSB0aGUgcGF0Y2ggYXV0aG9ycyBhbmQgd2lsbCBhcHBy
ZWNpYXRlIGlmIHlvdSBjb3VsZCBwcm92aWRlCmEgZGV0YWlsZWQgZXhwbGFuYXRpb24gYWJvdXQg
d2h5IHRoaXMgTlVMTCBjaGVja2luZyBpcyBuZWVkZWQgYmVjYXVzZSBJCnRoaW5rIGl0IGlzIHVu
bmVlZGVkLCBlc3BlY2lhbGx5IGdpdmVuIHRoYXQgb3RoZXIgSU9NTVUgZHJpdmVycyBkb24ndApo
YXZlIHN1Y2ggY2hlY2suCgpJJ20gYXNraW5nIHRoaXMgcXVlc3Rpb24gc2Vjb25kIHRpbWUgbm93
LCBwbGVhc2UgZG9uJ3QgaWdub3JlIHJldmlldwpjb21tZW50cyBuZXh0IHRpbWUuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlz
dAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
