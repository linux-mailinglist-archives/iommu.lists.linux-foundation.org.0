Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D869E46D5E0
	for <lists.iommu@lfdr.de>; Wed,  8 Dec 2021 15:37:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3591241CD1;
	Wed,  8 Dec 2021 14:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrzMs5RXGrZb; Wed,  8 Dec 2021 14:37:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A525E41C0E;
	Wed,  8 Dec 2021 14:37:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76030C0012;
	Wed,  8 Dec 2021 14:37:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77FFAC0012
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 14:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52D4E82803
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 14:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaBXI0vt9seS for <iommu@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 14:37:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F26780D7D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 14:37:38 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a37so3086421ljq.13
 for <iommu@lists.linux-foundation.org>; Wed, 08 Dec 2021 06:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YQEKCLjlalppfIwA7C25NVMf1kXovJJ5rxk2lrnjyHg=;
 b=So2ZQ3i6muj1swwi9nVQYixhTs2rFja9AiQ6nJ9nLNUIVvFPji2T37cMyWIorjB8Cm
 2HpT3VAsnMAI8MqyDt/bzbrGGVvEPgYnznzoMIjXisy2rgL7LhukcLS+gjMTc5PLPjK2
 NzwMGX242y2VPjN8Ire2j6nsYdLo1b4Zi00Q3ulub8RG6MjGuARAm7CeXDUofBVzZr+M
 PvBTA4zf6RJye7X0Pgssf1FneIVFaGZxlqSPL0pHfM6Yau4A7z4BYBI4sZRD1/mYTMdi
 VBv+bE+3odK++P8GmCHqwKt500sx4N8ZGyFXykXUlrL2ZryYYVvyT9WViSfMgJ3EmR/N
 E4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YQEKCLjlalppfIwA7C25NVMf1kXovJJ5rxk2lrnjyHg=;
 b=IuC/k9dHPpAhJ7w2QbpRsaI5P20AS0nxD9OcCel4RAR/vtBRB+2zrKW6HDrTd2d4Jv
 g/JpL4KVPD+XyLhh/5Tk8NW1bI7Ii3Ha1jF85hrCieM0PEnaDRYJLdHqmYDqlKmTc09c
 rb04UVxMJTuTvyk6uI0Roll5+7KPEifzzE7bNOF+QZgjctYJBviwaZPwc71qTFmmsLxG
 16ynOdpW/yiUXzM6E52wt8fwQ2ih6vPIetqMLTW+n1svuEZS1kP21G9YiN8n1udf+mCk
 xeWgYHZSAacqPfS2ERV2LZK9lK+wvGQ2wk6oqgMxvqLNMsxPdPooOepZe3LomVm+ebW8
 U36Q==
X-Gm-Message-State: AOAM530FFREBFhSMqiPa6x5qjF/1FvD6m0yUKJRjrL2Y0We+9aMiWDZ/
 92HVf9jjmiiJO5u+Sal7G/8=
X-Google-Smtp-Source: ABdhPJyorDpZti4BMtPd9AOn+iX5gnjrZmrS7HTPOzlS2hL594mfM25Qm0jMuzeLpVYBk0sn/FQnPA==
X-Received: by 2002:a2e:8e38:: with SMTP id r24mr47966640ljk.450.1638974256178; 
 Wed, 08 Dec 2021 06:37:36 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id z8sm270446lfu.128.2021.12.08.06.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 06:37:35 -0800 (PST)
Subject: Re: [PATCH v7 6/6] iommu/tegra-smmu: Add pagetable mappings to debugfs
To: Nicolin Chen <nicolinc@nvidia.com>, thierry.reding@gmail.com,
 joro@8bytes.org, will@kernel.org
References: <20211208084732.23363-1-nicolinc@nvidia.com>
 <20211208084732.23363-7-nicolinc@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <085d4e6a-31b1-37c8-fe31-fb15119affc6@gmail.com>
Date: Wed, 8 Dec 2021 17:37:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208084732.23363-7-nicolinc@nvidia.com>
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

SGksCgowOC4xMi4yMDIxIDExOjQ3LCBOaWNvbGluIENoZW4g0L/QuNGI0LXRgjoKPiBUaGlzIHBh
dGNoIGR1bXBzIGFsbCBhY3RpdmUgbWFwcGluZyBlbnRyaWVzIGZyb20gcGFnZXRhYmxlIHRvIGEK
PiBkZWJ1Z2ZzIGRpcmVjdG9yeSBuYW1lZCAibWFwcGluZ3MiLgo+IAo+IEF0dGFjaGluZyBhbiBl
eGFtcGxlOgo+IAo+IFtTV0dST1VQOiB4dXNiX2hvc3RdIFthczogKGlkOiA1KSwgKGF0dHI6IFJ8
V3wtKSwgKHBkX2RtYTogMHgwMDAwMDAwMDgwMDA1MDAwKV0KPiB7Cj4gICAgICAgICBbaW5kZXg6
IDEwMjNdIDB4ZjAwODAwNDAgKGNvdW50OiA1MikKPiAgICAgICAgIHsKPiAgICAgICAgICAgICAg
ICAgUFRFIFJBTkdFICAgICAgfCBBVFRSIHwgUEhZUyAgICAgICAgICAgICAgIHwgSU9WQSAgICAg
ICAgICAgICAgIHwgU0laRQo+ICAgICAgICAgICAgICAgICBbIzkxMyAsICM5MTMgXSB8IDB4NyAg
fCAweDAwMDAwMDAxMDI2NzQwMDAgfCAweDAwMDAwMDAwZmZmOTEwMDAgfCAweDEwMDAKPiAgICAg
ICAgICAgICAgICAgWyM5MTQgLCAjOTE0IF0gfCAweDcgIHwgMHgwMDAwMDAwMTAyNjcyMDAwIHwg
MHgwMDAwMDAwMGZmZjkyMDAwIHwgMHgxMDAwCj4gICAgICAgICAgICAgICAgIFsjOTE1ICwgIzkx
NSBdIHwgMHg3ICB8IDB4MDAwMDAwMDEwMjY3MTAwMCB8IDB4MDAwMDAwMDBmZmY5MzAwMCB8IDB4
MTAwMAo+ICAgICAgICAgICAgICAgICBbIzkxNiAsICM5MTYgXSB8IDB4NyAgfCAweDAwMDAwMDAx
MDI2NzAwMDAgfCAweDAwMDAwMDAwZmZmOTQwMDAgfCAweDEwMDAKPiAgICAgICAgICAgICAgICAg
WyM5MjEgLCAjOTIxIF0gfCAweDcgIHwgMHgwMDAwMDAwMGZjYzAwMDAwIHwgMHgwMDAwMDAwMGZm
Zjk5MDAwIHwgMHgxMDAwCj4gICAgICAgICAgICAgICAgIFsjOTIyICwgIzkyMiBdIHwgMHg3ICB8
IDB4MDAwMDAwMDEwMjY2ZDAwMCB8IDB4MDAwMDAwMDBmZmY5YTAwMCB8IDB4MTAwMAo+ICAgICAg
ICAgICAgICAgICBbIzkyMyAsICM5MjMgXSB8IDB4NyAgfCAweDAwMDAwMDAxMDI2NmMwMDAgfCAw
eDAwMDAwMDAwZmZmOWIwMDAgfCAweDEwMDAKPiAgICAgICAgICAgICAgICAgWyM5NDggLCAjOTQ4
IF0gfCAweDcgIHwgMHgwMDAwMDAwMTAyNjY4MDAwIHwgMHgwMDAwMDAwMGZmZmI0MDAwIHwgMHgx
MDAwCj4gICAgICAgICAgICAgICAgIFsjOTQ5ICwgIzk0OSBdIHwgMHg3ICB8IDB4MDAwMDAwMDEw
MjY2NzAwMCB8IDB4MDAwMDAwMDBmZmZiNTAwMCB8IDB4MTAwMAo+ICAgICAgICAgICAgICAgICBb
Izk1MCAsICM5NTAgXSB8IDB4NyAgfCAweDAwMDAwMDAxMDI2NjYwMDAgfCAweDAwMDAwMDAwZmZm
YjYwMDAgfCAweDEwMDAKPiAgICAgICAgICAgICAgICAgWyM5NTEgLCAjOTUxIF0gfCAweDcgIHwg
MHgwMDAwMDAwMTAyNjY1MDAwIHwgMHgwMDAwMDAwMGZmZmI3MDAwIHwgMHgxMDAwCj4gICAgICAg
ICAgICAgICAgIFsjOTUyICwgIzk1MiBdIHwgMHg3ICB8IDB4MDAwMDAwMDEwMjY0YjAwMCB8IDB4
MDAwMDAwMDBmZmZiODAwMCB8IDB4MTAwMAo+ICAgICAgICAgICAgICAgICBbIzk1MyAsICM5NTMg
XSB8IDB4NyAgfCAweDAwMDAwMDAxMDI2NGEwMDAgfCAweDAwMDAwMDAwZmZmYjkwMDAgfCAweDEw
MDAKPiAgICAgICAgICAgICAgICAgWyM5NTQgLCAjOTU0IF0gfCAweDcgIHwgMHgwMDAwMDAwMTAy
NjQ5MDAwIHwgMHgwMDAwMDAwMGZmZmJhMDAwIHwgMHgxMDAwCj4gICAgICAgICAgICAgICAgIFsj
OTU1ICwgIzk1NSBdIHwgMHg3ICB8IDB4MDAwMDAwMDEwMjY0ODAwMCB8IDB4MDAwMDAwMDBmZmZi
YjAwMCB8IDB4MTAwMAo+ICAgICAgICAgICAgICAgICBbIzk1NiAsICM5NTYgXSB8IDB4NyAgfCAw
eDAwMDAwMDAxMDI2MGYwMDAgfCAweDAwMDAwMDAwZmZmYmMwMDAgfCAweDEwMDAKPiAgICAgICAg
ICAgICAgICAgWyM5NTcgLCAjOTU3IF0gfCAweDcgIHwgMHgwMDAwMDAwMTAyNjBlMDAwIHwgMHgw
MDAwMDAwMGZmZmJkMDAwIHwgMHgxMDAwCj4gICAgICAgICAgICAgICAgIFsjOTU4ICwgIzk1OCBd
IHwgMHg3ICB8IDB4MDAwMDAwMDEwMjYwZDAwMCB8IDB4MDAwMDAwMDBmZmZiZTAwMCB8IDB4MTAw
MAo+ICAgICAgICAgICAgICAgICBbIzk1OSAsICM5NTkgXSB8IDB4NyAgfCAweDAwMDAwMDAxMDI2
MGIwMDAgfCAweDAwMDAwMDAwZmZmYmYwMDAgfCAweDEwMDAKPiAgICAgICAgICAgICAgICAgWyM5
NjAgLCAjOTkyIF0gfCAweDcgIHwgMHgwMDAwMDAwMTAyNWVhMDAwIHwgMHgwMDAwMDAwMGZmZmMw
MDAwIHwgMHgyMTAwMAo+ICAgICAgICAgfQo+IH0KPiBUb3RhbCBQREVzOiAxLCB0b3RhbCBQVEVz
OiA1MgoKVGhlIHBhdGNoIGlzIGFsbW9zdCBnb29kIHRvIG1lLCB0aGVyZSBpcyBvbmUgbml0LgoK
T24gb2xkZXIgU29DcyB3ZSBwdXQgbXVsdGlwbGUgZGV2aWNlcyBpbnRvIHRoZSBzYW1lIHNoYXJl
ZCBncm91cCBhbmQgdGhlIGRlYnVnZnMgc2hvd3MgaXQgYXMgdGhlIGZpcnN0IG1lbWJlciBvZiB0
aGUgZ3JvdXAuCgpUaGlzIGlzIHdoYXQgd2UgZ2V0IG9uIFQzMCB1c2luZyB0aGlzIHY3OgoKIyBs
cy9zeXMva2VybmVsL2RlYnVnL3NtbXUvbWFwcGluZ3MKZzIgIGhjICB2ZGUKCiMgY2F0IC9zeXMv
a2VybmVsL2RlYnVnL3NtbXUvbWFwcGluZ3MvZzIgCltTV0dST1VQOiBnMl0gW2FzOiAoaWQ6IDIp
LCAoYXR0cjogUnxXfC0pLCAocGRfZG1hOiAweDgzNGE2MDAwKV0KewogICAgICAgIFtpbmRleDog
MF0gMHhmMDA4MzQ5NCAoY291bnQ6IDEwMDApCiAgICAgICAgewogICAgICAgICAgICAgICAgUFRF
IFJBTkdFICAgICAgfCBBVFRSIHwgUEhZUyAgICAgICB8IElPVkEgICAgICAgfCBTSVpFICAgICAg
IAogICAgICAgICAgICAgICAgWyMwICAgLCAjMTUgIF0gfCAweDcgIHwgMHhiZmRlMDAwMCB8IDB4
MDAwMDAwMDAgfCAweDEwMDAwICAgIAogICAgICAgICAgICAgICAgWyMxNiAgLCAjNDcgIF0gfCAw
eDcgIHwgMHhiZmRjMDAwMCB8IDB4MDAwMTAwMDAgfCAweDIwMDAwICAgIAogICAgICAgICAgICAg
ICAgWyM0OCAgLCAjMTExIF0gfCAweDcgIHwgMHhiZmQ4MDAwMCB8IDB4MDAwMzAwMDAgfCAweDQw
MDAwICAgIAogICAgICAgICAgICAgICAgWyMxMTIgLCAjMjM5IF0gfCAweDcgIHwgMHhiZmQwMDAw
MCB8IDB4MDAwNzAwMDAgfCAweDgwMDAwICAgIAogICAgICAgICAgICAgICAgWyMyNDAgLCAjNDk1
IF0gfCAweDcgIHwgMHhiZmMwMDAwMCB8IDB4MDAwZjAwMDAgfCAweDEwMDAwMCAgIAogICAgICAg
ICAgICAgICAgWyM0OTYgLCAjOTk5IF0gfCAweDcgIHwgMHhiZjQwMDAwMCB8IDB4MDAxZjAwMDAg
fCAweDFmODAwMCAgIAogICAgICAgIH0KfQpUb3RhbCBQREVzOiAxLCB0b3RhbCBQVEVzOiAxMDAw
CgpTZWUgdGhhdCBuYW1lIGlzICJnMiIsIG1lYW53aGlsZSB0aGVzZSBtYXBwaW5ncyBhcmUgbWFk
ZSBieSBkaXNwbGF5IGNsaWVudCBkcml2ZXIuCgpJIGNoYW5nZWQgeW91ciBwYXRjaCB0byB1c2Ug
dGhlIHByb3BlciBncm91cCBuYW1lIGFuZCB0byBzaG93IGFsbCBtZW1iZXJzIG9mIHRoZSBncm91
cCwgc2VlIHRoYXQgY2hhbmdlIGluIHRoZSBlbmQgb2YgdGhpcyBlbWFpbC4KCldpdGggbXkgY2hh
bmdlIGFwcGxpZWQsIHdlIGdldDoKCiMgbHMvc3lzL2tlcm5lbC9kZWJ1Zy9zbW11L21hcHBpbmdz
CmRybSAgaGMgIHZkZQoKIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvc21tdS9tYXBwaW5ncy9kcm0g
CltTV0dST1VQOiBkYywgZGNiLCBnMiwgbnYsIG52Ml0gW2FzOiAoaWQ6IDIpLCAoYXR0cjogUnxX
fC0pLCAocGRfZG1hOiAweDgyNDgwMDAwKV0KewogICAgICAgIFtpbmRleDogMF0gMHhmMDA4MzU4
MyAoY291bnQ6IDEwMDApCiAgICAgICAgewogICAgICAgICAgICAgICAgUFRFIFJBTkdFICAgICAg
fCBBVFRSIHwgUEhZUyAgICAgICB8IElPVkEgICAgICAgfCBTSVpFICAgICAgIAogICAgICAgICAg
ICAgICAgWyMwICAgLCAjMTUgIF0gfCAweDcgIHwgMHhiZmRlMDAwMCB8IDB4MDAwMDAwMDAgfCAw
eDEwMDAwICAgIAogICAgICAgICAgICAgICAgWyMxNiAgLCAjNDcgIF0gfCAweDcgIHwgMHhiZmRj
MDAwMCB8IDB4MDAwMTAwMDAgfCAweDIwMDAwICAgIAogICAgICAgICAgICAgICAgWyM0OCAgLCAj
MTExIF0gfCAweDcgIHwgMHhiZmQ4MDAwMCB8IDB4MDAwMzAwMDAgfCAweDQwMDAwICAgIAogICAg
ICAgICAgICAgICAgWyMxMTIgLCAjMjM5IF0gfCAweDcgIHwgMHhiZmQwMDAwMCB8IDB4MDAwNzAw
MDAgfCAweDgwMDAwICAgIAogICAgICAgICAgICAgICAgWyMyNDAgLCAjNDk1IF0gfCAweDcgIHwg
MHhiZmMwMDAwMCB8IDB4MDAwZjAwMDAgfCAweDEwMDAwMCAgIAogICAgICAgICAgICAgICAgWyM0
OTYgLCAjOTk5IF0gfCAweDcgIHwgMHhiZjQwMDAwMCB8IDB4MDAxZjAwMDAgfCAweDFmODAwMCAg
IAogICAgICAgIH0KfQpUb3RhbCBQREVzOiAxLCB0b3RhbCBQVEVzOiAxMDAwCgotLS0gPjggLS0t
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS90ZWdyYS1zbW11LmMgYi9kcml2ZXJzL2lvbW11
L3RlZ3JhLXNtbXUuYwppbmRleCA1NzVlODIwNzYyNzAuLmZiMTMyNmE3MjAzOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9pb21tdS90ZWdyYS1zbW11LmMKKysrIGIvZHJpdmVycy9pb21tdS90ZWdyYS1z
bW11LmMKQEAgLTUwOSw2ICs1MDksNyBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9zbW11X2FzX3VucHJl
cGFyZShzdHJ1Y3QgdGVncmFfc21tdSAqc21tdSwKIHN0YXRpYyBpbnQgdGVncmFfc21tdV9kZWJ1
Z2ZzX21hcHBpbmdzX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICpkYXRhKQogewogCXN0
cnVjdCB0ZWdyYV9zbW11X2dyb3VwICpncm91cCA9IHMtPnByaXZhdGU7CisJY29uc3Qgc3RydWN0
IHRlZ3JhX3NtbXVfZ3JvdXBfc29jICpzb2M7CiAJY29uc3Qgc3RydWN0IHRlZ3JhX3NtbXVfc3dn
cm91cCAqc3dncnA7CiAJc3RydWN0IHRlZ3JhX3NtbXVfYXMgKmFzOwogCXN0cnVjdCB0ZWdyYV9z
bW11ICpzbW11OwpAQCAtNTI0LDYgKzUyNSw3IEBAIHN0YXRpYyBpbnQgdGVncmFfc21tdV9kZWJ1
Z2ZzX21hcHBpbmdzX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICpkYXRhKQogCiAJc3dn
cnAgPSBncm91cC0+c3dncnA7CiAJc21tdSA9IGdyb3VwLT5zbW11OworCXNvYyA9IGdyb3VwLT5z
b2M7CiAJYXMgPSBncm91cC0+YXM7CiAKIAltdXRleF9sb2NrKCZzbW11LT5sb2NrKTsKQEAgLTUz
Niw3ICs1MzgsMzggQEAgc3RhdGljIGludCB0ZWdyYV9zbW11X2RlYnVnZnNfbWFwcGluZ3Nfc2hv
dyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKmRhdGEpCiAJaWYgKCFwZCkKIAkJZ290byB1bmxv
Y2s7CiAKLQlzZXFfcHJpbnRmKHMsICJbU1dHUk9VUDogJXNdICIsIHN3Z3JwLT5uYW1lKTsKKwlz
ZXFfcHV0cyhzLCAiW1NXR1JPVVA6ICIpOworCWlmIChzb2MpIHsKKwkJYm9vbCBmaXJzdF9zd2dy
b3VwID0gdHJ1ZTsKKwkJdW5zaWduZWQgaW50IGk7CisKKwkJZm9yIChpID0gMDsgaSA8IHNvYy0+
bnVtX3N3Z3JvdXBzOyBpKyspIHsKKwkJCXN3Z3JwID0gdGVncmFfc21tdV9maW5kX3N3Z3JwKHNt
bXUsIHNvYy0+c3dncm91cHNbaV0pOworCisJCQlpZiAoV0FSTl9PTighc3dncnApKQorCQkJCWdv
dG8gdW5sb2NrOworCisJCQl2YWwgPSBzbW11X3JlYWRsKHNtbXUsIHN3Z3JwLT5yZWcpOworCisJ
CQlpZiAoISh2YWwgJiBTTU1VX0FTSURfRU5BQkxFKSkKKwkJCQljb250aW51ZTsKKworCQkJaWYg
KFdBUk5fT04oKHZhbCAmIFNNTVVfQVNJRF9NQVNLKSAhPSBhcy0+aWQpKQorCQkJCWNvbnRpbnVl
OworCisJCQlpZiAoZmlyc3Rfc3dncm91cCkKKwkJCQlmaXJzdF9zd2dyb3VwID0gZmFsc2U7CisJ
CQllbHNlCisJCQkJc2VxX3B1dHMocywgIiwgIik7CisKKwkJCXNlcV9wcmludGYocywgIiVzIiwg
c3dncnAtPm5hbWUpOworCQl9CisJfSBlbHNlIHsKKwkJV0FSTl9PTigodmFsICYgU01NVV9BU0lE
X01BU0spICE9IGFzLT5pZCk7CisJCXNlcV9wcmludGYocywgIiVzIiwgc3dncnAtPm5hbWUpOwor
CX0KKwlzZXFfcHV0cyhzLCAiXSAiKTsKKwogCXNlcV9wcmludGYocywgIlthczogKGlkOiAlZCks
ICIsIGFzLT5pZCk7CiAJc2VxX3ByaW50ZihzLCAiKGF0dHI6ICVjfCVjfCVjKSwgIiwKIAkJICAg
YXMtPmF0dHIgJiBTTU1VX1BEX1JFQURBQkxFID8gJ1InIDogJy0nLApAQCAtNjMxLDYgKzY2NCw3
IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX3NtbXVfYXR0YWNoX2FzKHN0cnVjdCB0ZWdyYV9zbW11ICpz
bW11LAogewogCWNvbnN0IHN0cnVjdCB0ZWdyYV9zbW11X3N3Z3JvdXAgKnN3Z3JwOwogCXN0cnVj
dCB0ZWdyYV9zbW11X2dyb3VwICpncm91cDsKKwljb25zdCBjaGFyICpuYW1lOwogCiAJLyogRmlu
ZCBzd2dycCBhY2NvcmRpbmcgdG8gdGhlIHN3Z3JvdXAgaWQgKi8KIAlzd2dycCA9IHRlZ3JhX3Nt
bXVfZmluZF9zd2dycChzbW11LCBzd2dyb3VwKTsKQEAgLTY0NywxMCArNjgxLDE2IEBAIHN0YXRp
YyB2b2lkIHRlZ3JhX3NtbXVfYXR0YWNoX2FzKHN0cnVjdCB0ZWdyYV9zbW11ICpzbW11LAogCQkJ
CSAib3ZlcndyaXRpbmcgZ3JvdXAtPmFzIGZvciBzd2dyb3VwOiAlc1xuIiwgc3dncnAtPm5hbWUp
OwogCQlncm91cC0+YXMgPSBhczsKIAotCQlpZiAoc21tdS0+ZGVidWdmc19tYXBwaW5ncykKLQkJ
CWRlYnVnZnNfY3JlYXRlX2ZpbGUoZ3JvdXAtPnN3Z3JwLT5uYW1lLCAwNDQ0LAorCQlpZiAoc21t
dS0+ZGVidWdmc19tYXBwaW5ncykgeworCQkJaWYgKGdyb3VwLT5zb2MpCisJCQkJbmFtZSA9IGdy
b3VwLT5zb2MtPm5hbWU7CisJCQllbHNlCisJCQkJbmFtZSA9IGdyb3VwLT5zd2dycC0+bmFtZTsK
KworCQkJZGVidWdmc19jcmVhdGVfZmlsZShuYW1lLCAwNDQ0LAogCQkJCQkgICAgc21tdS0+ZGVi
dWdmc19tYXBwaW5ncywgZ3JvdXAsCiAJCQkJCSAgICAmdGVncmFfc21tdV9kZWJ1Z2ZzX21hcHBp
bmdzX2ZvcHMpOworCQl9CiAKIAkJYnJlYWs7CiAJfQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vaW9tbXU=
