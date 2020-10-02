Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418C28150A
	for <lists.iommu@lfdr.de>; Fri,  2 Oct 2020 16:26:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C44C1274DB;
	Fri,  2 Oct 2020 14:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3hnN2rB+Sdv; Fri,  2 Oct 2020 14:26:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 113362000F;
	Fri,  2 Oct 2020 14:26:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1020C0895;
	Fri,  2 Oct 2020 14:26:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8CDDC0051
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 97ED986594
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cY-ijx9DIKfA for <iommu@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 14:26:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D1968864D6
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:26:15 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id w11so2111491lfn.2
 for <iommu@lists.linux-foundation.org>; Fri, 02 Oct 2020 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NnO4CkB4CLW9Li8QejxKrb4H9LHQ8RR+HVvosy268zY=;
 b=mb2uQwoP34nGGHbHmdUqaOjeDzaN83FSARRIN0VBzz425u0SEvCy7ns0SwMEE9yBqO
 GCSkzW2DLg9ElRevEKch7PuUurfGyycbBQHtOMwGK1kaQVJRpYmfwWnpf8VqjPDSqEY6
 gm2f+6psB9i1AQaCrjbb+gQK9yqbfYcT5XVXdIBi+bfdTKyN+Emmq6L9EWUvlca7Hrlm
 zkmccNnH1nTSjs8EkbAAach4HXXPWWX7NxsDDQXrFu7sMtZ5/IwGFglnalU2w3+bM0Hp
 6FBS6zLtftOGIdGyrbT5jhw3bKH4v9l1vfeVUxZ3hxW7WAOKrxpo0bSelENtCLxbvW+v
 PGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NnO4CkB4CLW9Li8QejxKrb4H9LHQ8RR+HVvosy268zY=;
 b=XbJ2XzE5CQPvquL1C1G0mmJiUrEHOKS/71wiszC5CIutJCoRzUQ0iHCmuQug1zusds
 K1g6ExmNJasS42dlMKviphYYaBlQrVFXHz/+P2n0OSjKQYew/KDXmqpYzB/FgasJHqg9
 O5VxPxnKXHVwtsBcxk7cQVi+6LlbXn2BfEJdpGrKUWHlNItXxRSNWrsDf+Y0ivFxBF8B
 NiAsXH5MBYtJJj2ngDUqlyEE66hG8uAaqDJzCdAiX6ooOzaWqWDfA2YUa/IGWWQZmhNj
 bGPMDnqOVMHjSbVKydSlmUeDiUV3GTZNqa9lZUbTZKZG5nD3eTliaQ3zlLGgJw6W7rmY
 QXig==
X-Gm-Message-State: AOAM533MGPKlvoziERXqnxOUgp0fj+WszSe5xRtE6/fTwNnVm0V43OzO
 rj4rqNrHlUaLDJowqtzksQs=
X-Google-Smtp-Source: ABdhPJwAi3WOx1lsk/3Yq9rkV8i/y5IPzBxNkfq7fht7QwRNUutlaKe9RZ/isRIDDhFw7wypYW6IHA==
X-Received: by 2002:a19:9cf:: with SMTP id 198mr1068551lfj.214.1601648774105; 
 Fri, 02 Oct 2020 07:26:14 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru.
 [109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id q24sm316363lfo.149.2020.10.02.07.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 07:26:13 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-2-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <90e4709c-1684-a280-92dc-0a4de2e4457b@gmail.com>
Date: Fri, 2 Oct 2020 17:26:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002060807.32138-2-nicoleotsuka@gmail.com>
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

MDIuMTAuMjAyMCAwOTowOCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gIHN0YXRpYyB2b2lk
IHRlZ3JhX3NtbXVfZGV0YWNoX2RldihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sIHN0cnVj
dCBkZXZpY2UgKmRldikKPiAgewo+ICsJc3RydWN0IGlvbW11X2Z3c3BlYyAqZndzcGVjID0gZGV2
X2lvbW11X2Z3c3BlY19nZXQoZGV2KTsKPiAgCXN0cnVjdCB0ZWdyYV9zbW11X2FzICphcyA9IHRv
X3NtbXVfYXMoZG9tYWluKTsKPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25v
ZGU7Cj4gIAlzdHJ1Y3QgdGVncmFfc21tdSAqc21tdSA9IGFzLT5zbW11Owo+IC0Jc3RydWN0IG9m
X3BoYW5kbGVfYXJncyBhcmdzOwo+ICAJdW5zaWduZWQgaW50IGluZGV4ID0gMDsKPiAgCj4gLQl3
aGlsZSAoIW9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKG5wLCAiaW9tbXVzIiwgIiNpb21tdS1j
ZWxscyIsIGluZGV4LAo+IC0JCQkJCSAgICZhcmdzKSkgewo+IC0JCXVuc2lnbmVkIGludCBzd2dy
b3VwID0gYXJncy5hcmdzWzBdOwo+IC0KPiAtCQlpZiAoYXJncy5ucCAhPSBzbW11LT5kZXYtPm9m
X25vZGUpIHsKPiAtCQkJb2Zfbm9kZV9wdXQoYXJncy5ucCk7Cj4gLQkJCWNvbnRpbnVlOwo+IC0J
CX0KPiAtCj4gLQkJb2Zfbm9kZV9wdXQoYXJncy5ucCk7Cj4gKwlpZiAoIWZ3c3BlYykKPiArCQly
ZXR1cm47CgpXaGVuICFmd3NwZWMgY291bGQgYmUgdHJ1ZT8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lvbW11
