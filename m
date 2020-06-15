Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8321F9D7E
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 18:32:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 304EA885AE;
	Mon, 15 Jun 2020 16:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RIun-BteVFDl; Mon, 15 Jun 2020 16:32:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B869B8856F;
	Mon, 15 Jun 2020 16:32:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0AB1C016E;
	Mon, 15 Jun 2020 16:32:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26FD8C016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 16:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 211878815C
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 16:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rI1x2qf0-LM for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 16:32:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 59D7B8814F
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 16:32:16 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id u25so3444854lfm.1
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fMk2WCiKFI7HDNUd7jyJvNehAsaSBC9pPNifu9uuF5E=;
 b=e5Q4JjF9w+dM6qvdisFCw4sw574hVWyf3FxAuI24lHOW0+Ub5IUR90+zuw7eG1Q2Vs
 hbeyrdLAnUTx8Da0wb02cCcEJi6w69J1s4QG7/jkLBCDBG1JTxVk5vGjMZBuM6kHkFx/
 xNeulklIAuTMicpF1E0ZMT07sjoR9IW1n2hF/fAG1GZ45/6Xa4Vc65YTNlUpwV2XpybO
 gIdibt2xwWLkPD7Fdmd7WSGBtTXT6SlMztlfQBwYuckX0NDc9YYnirK8Svh3XDBHmmm3
 iXZ1nEL9KCkJvK3oW9IyovqyWILjMW2pkHrlgnq/r5WR3ATVMNPPoXipM/aXlCXZhrn+
 wqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fMk2WCiKFI7HDNUd7jyJvNehAsaSBC9pPNifu9uuF5E=;
 b=hLMxsZp+sxB9EQhmF5L5ZmqxBTMiGbyGpkzwul64NDnFgOPye2/ObxupMVmVj6+r/l
 gDiEJW2AbEk1LEy9Ao6pGwRUQ0+QG41hd045KbF2WOsBdoEbyl+6fWNUL8KO/LpWhJn2
 TxK5HwH22qFocE7MxcbUrlUEK5LtsTr4nMgIDlfsklQ9BkjolkF4ZK10rVBDS9MEvvn1
 MY+MXs8UgBaNzMCIvFpJaY169c0D2WoQRUe12d9/cghHhWSDGncan0iNw31nUgSlPEHK
 1PZQUxRQ01EWojPQYZZPf4swACrIkbwky8RUC0LGK6To0O4wa3kgOJKBj134i8pvw7Em
 cRig==
X-Gm-Message-State: AOAM533DBrY/S5SnKm0DtsF15szhyOwN/YpKMsEffVi6r1unPwmuQESp
 J7Sr/eS1ssZQSiP2kp5tiE4=
X-Google-Smtp-Source: ABdhPJz+g/xw+V5R8UknOJ0K9sfrwk4Ecr0W8o/gGvlvEGKkiqDGbUonmPvCse3iEffPw5EH41jd3g==
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr13196552lfq.4.1592238734394; 
 Mon, 15 Jun 2020 09:32:14 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id k1sm4662630lja.27.2020.06.15.09.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 09:32:13 -0700 (PDT)
Subject: Re: [PATCH v2] iommu/tegra-smmu: Add missing locks around mapping
 operations
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Joerg Roedel
 <joro@8bytes.org>, Jonathan Hunter <jonathanh@nvidia.com>
References: <20200525195437.14341-1-digetx@gmail.com>
Message-ID: <efe29e0d-5dbe-f6fa-2c4c-f8248c9aad29@gmail.com>
Date: Mon, 15 Jun 2020 19:32:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525195437.14341-1-digetx@gmail.com>
Content-Language: en-US
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

MjUuMDUuMjAyMCAyMjo1NCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gVGhlIG1hcHBp
bmcgb3BlcmF0aW9ucyBvZiB0aGUgVGVncmEgU01NVSBkcml2ZXIgYXJlIHN1YmplY3RlZCB0byBh
IHJhY2UKPiBjb25kaXRpb24gaXNzdWVzIGJlY2F1c2UgU01NVSBBZGRyZXNzIFNwYWNlIGlzbid0
IGFsbG9jYXRlZCBhbmQgZnJlZWQKPiBhdG9taWNhbGx5LCB3aGlsZSBpdCBzaG91bGQgYmUuIFRo
aXMgcGF0Y2ggbWFrZXMgdGhlIG1hcHBpbmcgb3BlcmF0aW9ucwo+IGF0b21pYywgaXQgZml4ZXMg
YW4gYWNjaWRlbnRhbGx5IHJlbGVhc2VkIEhvc3QxeCBBZGRyZXNzIFNwYWNlIHByb2JsZW0KPiB3
aGljaCBoYXBwZW5zIHdoaWxlIHJ1bm5pbmcgbXVsdGlwbGUgZ3JhcGhpY3MgdGVzdHMgaW4gcGFy
YWxsZWwgb24KPiBUZWdyYTMwLCBpLmUuIGJ5IGhhdmluZyBtdWx0aXBsZSB0aHJlYWRzIHJhY2lu
ZyB3aXRoIGVhY2ggb3RoZXIgaW4gdGhlCj4gSG9zdDF4J3Mgc3VibWlzc2lvbiBhbmQgY29tcGxl
dGlvbiBjb2RlIHBhdGhzLCBwZXJmb3JtaW5nIElPVkEgbWFwcGluZ3MKPiBhbmQgdW5tYXBwaW5n
cyBpbiBwYXJhbGxlbC4KPiAKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gU2lnbmVk
LW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+IC0tLQo+IAo+IENo
YW5nZWxvZzoKPiAKPiB2MjogLSBOb3cgdXNpbmcgbXV0ZXggaW5zdGVhZCBvZiBzcGlubG9jay4K
PiAKPiAgICAgLSBUaGUgX2xvY2tlZCBwb3N0Zml4IGlzIHJlcGxhY2VkIHdpdGggdGhlIHVuZGVy
c2NvcmVzIHByZWZpeC4KPiAKCkhlbGxvIFRoaWVycnkgYW5kIEpvZXJnIQoKR3V5cywgYXJlIHlv
dSBva2F5IHdpdGggdGhlIHYyIHZhcmlhbnQ/IFdpbGwgYmUgZ3JlYXQgaWYgd2UgY291bGQgZml4
CnRoZSBpc3N1ZSBBU0FQIHNpbmNlIGl0J3MgcXVpdGUgdW5wbGVhc2FudC4gVGhhbmtzIGluIGFk
dmFuY2UhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlv
bW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
