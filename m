Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EA730283406
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 12:37:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AEAC487066;
	Mon,  5 Oct 2020 10:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZbRGgHFE7Iw; Mon,  5 Oct 2020 10:37:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 529228705B;
	Mon,  5 Oct 2020 10:37:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FFFCC0051;
	Mon,  5 Oct 2020 10:37:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D0B1C0051
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 10:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 194D685608
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 10:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnJZlw9F0F9d for <iommu@lists.linux-foundation.org>;
 Mon,  5 Oct 2020 10:36:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4AA88855C6
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 10:36:58 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id 197so10192446lfo.11
 for <iommu@lists.linux-foundation.org>; Mon, 05 Oct 2020 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kXGxjrOECHo9Yx49QGExKC9VMrc3WpIW0kWli+WP6Wc=;
 b=fHgpEcUk5a1h/ZYcayz+n0HgwtBBcLPVDH60MdlYmQ6q1uhKixndlzQykidqHB5mtc
 t7XUXd/3M0YfRU8TRKSXnGeHzqymcHGdb1kkyPyhdnpxwVjek93PKmlERJT4spxrSsML
 e+biqMhblP2vDC8cAxpMc8nsz/z6v3bi/eewYMM0Bc9Ny6ftNgynxoM/naeY49qKQVz1
 Ktlp94D90cRnpS1+z4iSVuSzTxrglQg71Jp4A2mFLyYW2yW7RPnvt9B1pXqGm/eRAGfD
 FhPkYwF9oFyvg4CFrmcpjP+1PK+iQI5FUhTSr7Jy25Czo1auDwZR79F2nQqqL8ZHr1wV
 jHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kXGxjrOECHo9Yx49QGExKC9VMrc3WpIW0kWli+WP6Wc=;
 b=bct+3pCBujqmmHkoTxFTOZfit+GxFxgY74OutZY/fnuaA9/eRUvUIgPb6rV38Df+Sf
 xiWDEsSYHAqQ1laS/0M/tJOUwH9J0p6DVRASgBPKOmm+YoAxY09NofLMfAftADB3jwF0
 DlkkaY+503ogkLyIJPTXydiTspElzW5Eaq5Q95EjuBLl1tj1zWPoWOKlQeCKGnLP5q/Q
 Q8qPuJqAs9sNDkSO/I1id7CWLGeHYe5GDL50bp/LEzr2IP162PmGlwuZWtXZ1CevCbQ/
 0ebBkIeAWUaWl1gfwIUZJIWssREZWokG2GthsMuLwz4Jc5fQNJyGDNnk4I61AgCaXNec
 X/1w==
X-Gm-Message-State: AOAM533IbjTFrABZxfIVt899QL/cJFuFQA4z9KJuJybxR1eqzdJXHCFH
 cmWuznQEi0NUMwgUxFPE4fQ=
X-Google-Smtp-Source: ABdhPJyJ9IH5yjJ1w3bo8h3abEOag+7Bnq7V9LkS3PO1PNhlyJ50gniAAz1mop6Ok01XMQ2/IMImiw==
X-Received: by 2002:a19:7e0d:: with SMTP id z13mr5049605lfc.455.1601894216462; 
 Mon, 05 Oct 2020 03:36:56 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id i18sm2561967lfo.243.2020.10.05.03.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 03:36:55 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
 <0c66bab9-0132-d3fb-ea4e-de1278cf2b04@gmail.com>
 <20201005095351.GI425362@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ae48aaaf-fe10-6de4-06bb-2afbde799168@gmail.com>
Date: Mon, 5 Oct 2020 13:36:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005095351.GI425362@ulmo>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org
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

MDUuMTAuMjAyMCAxMjo1MywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBGcmksIE9j
dCAwMiwgMjAyMCBhdCAwNTo1MDowOFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDAyLjEwLjIwMjAgMTc6MjIsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+ICBzdGF0
aWMgaW50IHRlZ3JhX3NtbXVfb2ZfeGxhdGUoc3RydWN0IGRldmljZSAqZGV2LAo+Pj4+ICAJCQkg
ICAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqYXJncykKPj4+PiAgewo+Pj4+ICsJc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqaW9tbXVfcGRldiA9IG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUoYXJn
cy0+bnApOwo+Pj4+ICsJc3RydWN0IHRlZ3JhX21jICptYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRh
KGlvbW11X3BkZXYpOwo+Pj4+ICAJdTMyIGlkID0gYXJncy0+YXJnc1swXTsKPj4+PiAgCj4+Pj4g
KwlvZl9ub2RlX3B1dChhcmdzLT5ucCk7Cj4+Pj4gKwo+Pj4+ICsJaWYgKCFtYyB8fCAhbWMtPnNt
bXUpCj4+Pj4gKwkJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4+PiBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShOVUxMKSB3aWxsIGNyYXNoLgo+Pj4KPj4KPj4gQWN0dWFsbHksIHBsYXRmb3JtX2dldF9kcnZk
YXRhKE5VTEwpIGNhbid0IGhhcHBlbi4gSSBvdmVybG9va2VkIHRoaXMuCj4gCj4gSG93IHNvPyBJ
dCdzIHRlY2huaWNhbGx5IHBvc3NpYmxlIGZvciB0aGUgaW9tbXVzIHByb3BlcnR5IHRvIHJlZmVy
ZW5jZSBhCj4gZGV2aWNlIHRyZWUgbm9kZSBmb3Igd2hpY2ggbm8gcGxhdGZvcm0gZGV2aWNlIHdp
bGwgZXZlciBiZSBjcmVhdGVkLCBpbgo+IHdoaWNoIGNhc2Ugb2ZfZmluZF9kZXZpY2VfYnlfbm9k
ZSgpIHdpbGwgcmV0dXJuIE5VTEwuIFRoYXQncyB2ZXJ5Cj4gdW5saWtlbHkgYW5kIHBlcmhhcHMg
d29ydGgganVzdCBjcmFzaGluZyBvbiB0byBtYWtlIHN1cmUgaXQgZ2V0cyBmaXhlZAo+IGltbWVk
aWF0ZWx5LgoKVGhlIHRlZ3JhX3NtbXVfb3BzIGFyZSByZWdpc3RlcmVkIGZyb20gdGhlIFNNTVUg
ZHJpdmVyIGl0c2VsZiBhbmQgTUMKZHJpdmVyIHNldHMgcGxhdGZvcm0gZGF0YSBiZWZvcmUgU01N
VSBpcyBpbml0aWFsaXplZCwgaGVuY2UgZGV2aWNlIGlzCmd1YXJhbnRlZWQgdG8gZXhpc3QgYW5k
IG1jIGNhbid0IGJlIE5VTEwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9p
b21tdQ==
