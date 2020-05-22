Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FABB1DDD09
	for <lists.iommu@lfdr.de>; Fri, 22 May 2020 04:13:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D7E589436;
	Fri, 22 May 2020 02:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdKRA7qEx3xK; Fri, 22 May 2020 02:13:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ACD5F89433;
	Fri, 22 May 2020 02:13:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94B20C0176;
	Fri, 22 May 2020 02:13:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C13AAC0176
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 02:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ADC73886B3
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 02:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2s0LM-SY7Ef3 for <iommu@lists.linux-foundation.org>;
 Fri, 22 May 2020 02:13:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D0307881BE
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 02:13:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x13so4438689pfn.11
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 19:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HANfjGaXtL4q1FSiLdXuotCYBYmAdZjgvWQJr0H9YMg=;
 b=lelQxwbz5KvLR8BmclI8jocAnat7kuQ1eoRzL4S3qO9Am83e3fverb4PWKqs6DEOyV
 NCdrcMPKKWM2WpSrCYZ8JIgZVhlby1jGUdTgnc5paxcSO+yOhjHZ0waaLltp5qtM79Ir
 7cVjPp9/qLsXl1tg2uYAOzrV72+cuggHGqg4L3wQxpNUiWn39K2jb05JVfUJ+E/EZ+ad
 tnxMBzEG/SPmbLbYrXFMbKdRrE9cidfG4wyUFnoPSK0Eyss0/H/7RVn/PUEBUQJcz/Ti
 /GBlephoJpBLfGqCBvjK2aMoFrvN0D/c7fg7WlMhF+ZE3/QFFcrN31nexgxv+NnNa+Mo
 Qptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HANfjGaXtL4q1FSiLdXuotCYBYmAdZjgvWQJr0H9YMg=;
 b=h9Rj+6Cs0nfQNC2cHSXcdEIOM92MxyGPfYaS6AXVvDeVYcWlcdzEv6NJzO3yeHN80x
 cIZHlt/BkQ+mwSD2iSICeSUnAsQZxFrMic7oEb73gPE5+L1IdhY1zDG1kqSailJ2m3hG
 oja1jgMu+OAJIwdCmeIKZWMltSH/NltYv8PdHrukd9UTlVXBWtKjzlvogtczJjyM3WiC
 SKQItjTfF9xIn531n77sCnoFOArJ7WVKZ24S8ddTk+CbYtDtuNT4fZ9hq9A9Ja8h+PYg
 RTPCkfDXWKKLC6Y0xdVT0JRqWwUkais+cBKXzSsWZTUWmUiK7Smmdj6CwRVlwQQTzFaN
 Z9fw==
X-Gm-Message-State: AOAM5312vRAtVIIpak0W+jioOXYoHGHcv6rlhaj9r7vu1w9ANhDEiG2t
 HAu6Q3CuvhGisU1haDq2ct5Tuw==
X-Google-Smtp-Source: ABdhPJxh64wrCE5tLGl7klLmD3mr5bD+4uqj8uhZIjERdP/SqzgqKR0fB/XxlGgIJJR01XokaX+kyA==
X-Received: by 2002:a63:c58:: with SMTP id 24mr11923950pgm.246.1590113623304; 
 Thu, 21 May 2020 19:13:43 -0700 (PDT)
Received: from [10.191.1.102] ([45.135.186.71])
 by smtp.gmail.com with ESMTPSA id y5sm5043843pge.50.2020.05.21.19.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 19:13:42 -0700 (PDT)
Subject: Re: [PATCH 0/2] Let pci_fixup_final access iommu_fwnode
To: Joerg Roedel <joro@8bytes.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 jean-philippe <jean-philippe@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, kenneth-lee-2012@foxmail.com,
 Wangzhou <wangzhou1@hisilicon.com>
References: <1589256511-12446-1-git-send-email-zhangfei.gao@linaro.org>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Message-ID: <631857df-8e70-88e3-9959-1a750faf4f85@linaro.org>
Date: Fri, 22 May 2020 10:13:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589256511-12446-1-git-send-email-zhangfei.gao@linaro.org>
Content-Language: en-US
Cc: linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGksIEpvZXJnCgpPbiAyMDIwLzUvMTIg5LiL5Y2IMTI6MDgsIFpoYW5nZmVpIEdhbyB3cm90ZToK
PiBTb21lIHBsYXRmb3JtIGRldmljZXMgYXBwZWFyIGFzIFBDSSBidXQgYXJlCj4gYWN0dWFsbHkg
b24gdGhlIEFNQkEgYnVzLCBhbmQgdGhleSBuZWVkIGZpeHVwIGluCj4gZHJpdmVycy9wY2kvcXVp
cmtzLmMgaGFuZGxpbmcgaW9tbXVfZndub2RlLgo+IFNvIGNhbGxpbmcgcGNpX2ZpeHVwX2ZpbmFs
IGFmdGVyIGlvbW11X2Z3bm9kZSBpcyBhbGxvY2F0ZWQuCj4KPiBGb3IgZXhhbXBsZToKPiBIaXNp
bGljb24gcGxhdGZvcm0gZGV2aWNlIG5lZWQgZml4dXAgaW4KPiBkcml2ZXJzL3BjaS9xdWlya3Mu
Ywo+Cj4gK3N0YXRpYyB2b2lkIHF1aXJrX2h1YXdlaV9wY2llX3N2YShzdHJ1Y3QgcGNpX2RldiAq
cGRldikKPiArewo+ICsJc3RydWN0IGlvbW11X2Z3c3BlYyAqZndzcGVjOwo+ICsKPiArCXBkZXYt
PmVldGxwX3ByZWZpeF9wYXRoID0gMTsKPiArCWZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNfZ2V0
KCZwZGV2LT5kZXYpOwo+ICsJaWYgKGZ3c3BlYykKPiArCQlmd3NwZWMtPmNhbl9zdGFsbCA9IDE7
Cj4gK30KPiArCj4gK0RFQ0xBUkVfUENJX0ZJWFVQX0ZJTkFMKFBDSV9WRU5ET1JfSURfSFVBV0VJ
LCAweGEyNTAsIHF1aXJrX2h1YXdlaV9wY2llX3N2YSk7Cj4gK0RFQ0xBUkVfUENJX0ZJWFVQX0ZJ
TkFMKFBDSV9WRU5ET1JfSURfSFVBV0VJLCAweGEyNTEsIHF1aXJrX2h1YXdlaV9wY2llX3N2YSk7
Cj4gICAKPgo+IFpoYW5nZmVpIEdhbyAoMik6Cj4gICAgaW9tbXUvb2Y6IExldCBwY2lfZml4dXBf
ZmluYWwgYWNjZXNzIGlvbW11X2Z3bm9kZQo+ICAgIEFDUEkvSU9SVDogTGV0IHBjaV9maXh1cF9m
aW5hbCBhY2Nlc3MgaW9tbXVfZndub2RlCj4KPiAgIGRyaXZlcnMvYWNwaS9hcm02NC9pb3J0LmMg
fCAxICsKPiAgIGRyaXZlcnMvaW9tbXUvb2ZfaW9tbXUuYyAgfCAxICsKPiAgIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4KV291bGQgeW91IG1pbmQgZ2l2ZSBhbnkgc3VnZ2VzdGlv
bj8KCldlIG5lZWQgYWNjZXNzIGZ3c3BlYy0+Y2FuX3N0YWxsIGRlc2NyaWJpbmcgdGhlIHBsYXRm
b3JtIGRldmljZSAoYSBmYWtlIApwY2llKSBjYW4gc3VwcG9ydCBzdGFsbCBmZWF0dXJlLgpjYW5f
c3RhbGwgd2lsbCBiZSB1c2VkIGFybV9zbW11X2FkZF9kZXZpY2UgWzFdLgpBbmQgc3RhbGwgaXMg
bm90IGEgcGNpIGZlYXR1cmUsIHNvIG5vIHN1Y2ggbWVtYmVyIGluIHN0cnVjdCBwY2lfZGV2LgoK
aW9tbXVfZndub2RlIGlzIGFsbG9jYXRlZCBpbiBpb21tdV9md3NwZWNfaW5pdCwgZnJvbSBvZl9w
Y2lfaW9tbXVfaW5pdCAKb3IgaW9ydF9wY2lfaW9tbXVfaW5pdC4KVGhlIHBjaV9maXh1cF9kZXZp
Y2UocGNpX2ZpeHVwX2ZpbmFsLCBkZXYpIGluIHBjaV9idXNfYWRkX2RldmljZSBpcyB0b28gCmVh
cmx5IHRoYXTCoCBpb21tdV9md25vZGUKaXMgbm90IGFsbG9jYXRlZC4KVGhlIHBjaV9maXh1cF9k
ZXZpY2UocGNpX2ZpeHVwX2VuYWJsZSwgZGV2KSBpbiBkb19wY2lfZW5hYmxlX2RldmljZSBpcyAK
dG9vIGxhdGUgYWZ0ZXIKCmFybV9zbW11X2FkZF9kZXZpY2UuCgoKU28gdGhlIGlkZWEgaGVyZSBp
cyBjYWxsaW5nIHBjaV9maXh1cF9kZXZpY2UocGNpX2ZpeHVwX2ZpbmFsKSBhZnRlcgpvZl9wY2lf
aW9tbXVfaW5pdCBhbmQgaW9ydF9wY2lfaW9tbXVfaW5pdCwgd2hlcmUgaW9tbXVfZndub2RlIGlz
IGFsbG9jYXRlZC4KCgoKWzFdIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LXBj
aS9tc2c5NDU1OS5odG1sCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby9pb21tdQ==
