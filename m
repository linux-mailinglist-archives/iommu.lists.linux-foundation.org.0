Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D734C25D48E
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 11:20:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A00487510;
	Fri,  4 Sep 2020 09:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipaYFYjq+MEA; Fri,  4 Sep 2020 09:20:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 254CC87511;
	Fri,  4 Sep 2020 09:20:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0785DC0052;
	Fri,  4 Sep 2020 09:20:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06018C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E9A9387511
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCsBevuAbFRo for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 09:19:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 08F9087510
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:19:59 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a22so715536ljp.13
 for <iommu@lists.linux-foundation.org>; Fri, 04 Sep 2020 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uratX28Mxl9/lGwuq+H8AvPcnvgdYTTOzgJnH3Evmiw=;
 b=ZN8SVwAzwCv5aAkw942KG/DUK4ZVxzqxD87UFYHEc5IrQY1Ubn27Pxai6GFj70e2e4
 kV3FSfVF1dohd9a2vKW10yzxOgPjPRnGQ0C21K14Otx1VoqyybKqDvqxjLsVbJXV2R8q
 Z2XW7nChKYavnxy8h/vUJ5SDA42YFhyA57mvHGRT92veSyUrRVO/HCOpqkM1RWoamuen
 TO/19TfRngmIx1S0vQ8Cs1Ii2Ox03FUmO5uWGJUo1qu0g9eoDbwd/2CP1Vii8qMew5/l
 u8AazwA9Gm1h5U3ZxtnaWBdM64vPNoYJ+aOvgYxf/6o37Tv2bLpEMQWlC2fhr4ZQA1m2
 /rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uratX28Mxl9/lGwuq+H8AvPcnvgdYTTOzgJnH3Evmiw=;
 b=YecTqbScrisYkrwFU4WQ7iHLOjN1h6JPL2aegtMhtW3RDDkWr9vW09yfmkwzasdyUy
 yb5veOUWge45T7f+CN3XeIpy7OS6zrzXJD3In7vbOFKza4b0dRMUfqMo59woZVEIiSdq
 xYdwvcAk7+u+giQl69TLMQuiqwln+xLztR5L4fJl+8XQF/4S/VGNU96r7/+q3ntTISw/
 F20fqGJEUxtjCZQe0gUn8itTBLxe9QN91VNYRskwgGON8HTYny0aYC/8zZGkgntSCH3M
 93EsicJUE6nVlaoQZVXdbCQIEaxP1JUu7xl8/nhZFb0ez9CuWF/45nO6i2oRxH5EZm3b
 s7Sw==
X-Gm-Message-State: AOAM532Aa4lZCzGOcbKIe5hEqT1uV5IWefpblxe8iUBDZi4hgOul4+Zv
 88pg83BTDRyBl20idGlBvzg=
X-Google-Smtp-Source: ABdhPJxcqOpdnKHFFAnaqeTyqOU+SdC4HwFZQfHee7jyhxo2CLcFF9WkZLkuU7g3cZ/cdIRs+aVvZg==
X-Received: by 2002:a2e:b008:: with SMTP id y8mr3023302ljk.421.1599211196950; 
 Fri, 04 Sep 2020 02:19:56 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id 201sm1158663ljf.75.2020.09.04.02.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2020 02:19:56 -0700 (PDT)
Subject: Re: [PATCH RESEND v3] iommu/tegra-smmu: Add missing locks around
 mapping operations
To: Joerg Roedel <joro@8bytes.org>
References: <20200814162252.31965-1-digetx@gmail.com>
 <20200904090519.GF6714@8bytes.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9f7b042e-db46-dd5b-acb8-9b1e8213fa62@gmail.com>
Date: Fri, 4 Sep 2020 12:19:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904090519.GF6714@8bytes.org>
Content-Language: en-US
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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

MDQuMDkuMjAyMCAxMjowNSwgSm9lcmcgUm9lZGVsINC/0LjRiNC10YI6Cj4gT24gRnJpLCBBdWcg
MTQsIDIwMjAgYXQgMDc6MjI6NTJQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiBU
aGUgbWFwcGluZyBvcGVyYXRpb25zIG9mIHRoZSBUZWdyYSBTTU1VIGRyaXZlciBhcmUgc3ViamVj
dGVkIHRvIGEgcmFjZQo+PiBjb25kaXRpb24gaXNzdWVzIGJlY2F1c2UgU01NVSBBZGRyZXNzIFNw
YWNlIGlzbid0IGFsbG9jYXRlZCBhbmQgZnJlZWQKPj4gYXRvbWljYWxseSwgd2hpbGUgaXQgc2hv
dWxkIGJlLiBUaGlzIHBhdGNoIG1ha2VzIHRoZSBtYXBwaW5nIG9wZXJhdGlvbnMKPj4gYXRvbWlj
LCBpdCBmaXhlcyBhbiBhY2NpZGVudGFsbHkgcmVsZWFzZWQgSG9zdDF4IEFkZHJlc3MgU3BhY2Ug
cHJvYmxlbQo+PiB3aGljaCBoYXBwZW5zIHdoaWxlIHJ1bm5pbmcgbXVsdGlwbGUgZ3JhcGhpY3Mg
dGVzdHMgaW4gcGFyYWxsZWwgb24KPj4gVGVncmEzMCwgaS5lLiBieSBoYXZpbmcgbXVsdGlwbGUg
dGhyZWFkcyByYWNpbmcgd2l0aCBlYWNoIG90aGVyIGluIHRoZQo+PiBIb3N0MXgncyBzdWJtaXNz
aW9uIGFuZCBjb21wbGV0aW9uIGNvZGUgcGF0aHMsIHBlcmZvcm1pbmcgSU9WQSBtYXBwaW5ncwo+
PiBhbmQgdW5tYXBwaW5ncyBpbiBwYXJhbGxlbC4KPj4KPj4gQ2M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5j
b20+Cj4gCj4gVGhpZXJyeSwgZG9lcyB0aGlzIGNoYW5nZSBsb29rIGdvb2QgdG8geW91Pwo+IAoK
SGVsbG8gSm9lcmcgYW5kIFRoaWVycnksCgpQbGVhc2UgdGFrZSBpbnRvIGFjY291bnQgdGhhdCB0
aGVyZSBpcyBhIHY1IG5vdyB0aGF0IEkgc2VudCBvdXQgYSBkYXkKYWdvLCBpdCdzIG1vcmUgb3B0
aW1pemVkIHZlcnNpb24gYW5kIHN1cHBvcnRzIGJvdGggYXRvbWljIGFuZCBub24tYXRvbWljCkdG
UCBmbGFncyBmb3IgdGhlIG1hcHBpbmcgb3BlcmF0aW9uLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vaW9tbXU=
