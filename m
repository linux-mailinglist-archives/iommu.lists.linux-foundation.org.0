Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD527E194
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 08:43:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3528E871D8;
	Wed, 30 Sep 2020 06:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdKPZU1IV4rM; Wed, 30 Sep 2020 06:43:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AFCA5871D1;
	Wed, 30 Sep 2020 06:43:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A559BC0051;
	Wed, 30 Sep 2020 06:43:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33EB3C0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 06:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1BC54871D1
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 06:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMUgmHDWZxEN for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 06:43:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8CDA2871C7
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 06:43:51 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s19so411433plp.3
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=3+GU4zxm0Td/KM5SRNzPIJUthrCnvW7q6ZorJHiP25c=;
 b=akm+iSr6qnW70fDV3jaZfWWqU3vhS6CWumvkgTeR4+hpoVUb0TeAiyfFFvEkvbtzxQ
 zC1uH6jgIW84OTxKT7una4YVN8x6wz4G/sXdWo9hfFVQvxk4LO1WecENt87rFgQWIbk8
 H6VlRIPVbU+gNgkEBskDrRNbNdd2a8Nf2mlFx2MPnVsoHx3FRVu6x1YwRxM00WlZ+3tm
 GG3TaAO4baKb/luzBXlXkJdrM7FxNgItX4udQZeZMXqNdq536ikZ7sjO+iKUL6SsmAF1
 HqVN8uyev/WaKIM6BQu63zKW1781GcZyyP/5khDrckTMqCyQT0MxUVLI80zVGySFacnt
 l2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3+GU4zxm0Td/KM5SRNzPIJUthrCnvW7q6ZorJHiP25c=;
 b=rmSYPoVTPpg/IgrXXmzxyrrTsv9rezfqlPn6TCNXK3K0lm4LqZDDHZ6QIOXiLh0mLP
 OmY4R6cwU26sSfNx0o81bbdpzinJicgbTCDlLDhkDKv5AK7JmTf3eSKf31Bj1cckEi8C
 IOmWfvjOr2zZH6/Ad49CT3wnC/hf8IrpLeTPy4jgDEMVIlabtZOuv3eq4moRYZMhyXYW
 SgFbR8gVoGtNF0/lDGgHFkvRqKkK0lr5UEv/g9EqxsZmx9hHiDXmU/qsj6rsQZQ4EHQf
 j4U/TfUzRo+/y4tXVn06nK85mD9xKlX7t8bRIunsqNmREGVR3SQgfS9n8hxVmep1yaI1
 j7dg==
X-Gm-Message-State: AOAM531NNIDIyKXw26i/XQV3kI18VpF4GUnbo33ZW/2HORRsb8bZ0Cc2
 M+el7BdnhDJOZjnxJjEmKvk=
X-Google-Smtp-Source: ABdhPJwysfEAZOo8P4hlopqTLpZc4kTN+he7jDU+vAlyRRSPVRDKHWaVI9riTckyYU663STgPg5MNQ==
X-Received: by 2002:a17:90a:f001:: with SMTP id
 bt1mr1179816pjb.116.1601448231098; 
 Tue, 29 Sep 2020 23:43:51 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z9sm1023556pfk.118.2020.09.29.23.43.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Sep 2020 23:43:50 -0700 (PDT)
Date: Tue, 29 Sep 2020 23:38:20 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/3] memory: tegra: Add helper function
 tegra_get_memory_controller
Message-ID: <20200930063820.GD16460@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-2-nicoleotsuka@gmail.com>
 <93803d8b-9863-e977-fa87-a03e877b095d@gmail.com>
 <20200930054455.GF31821@Asurada-Nvidia>
 <2f752179-5ad3-c000-8794-494c79f7b21f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f752179-5ad3-c000-8794-494c79f7b21f@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 krzk@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDk6MzI6MjBBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDMwLjA5LjIwMjAgMDg6NDQsIE5pY29saW4gQ2hlbiDQv9C40YjQtdGCOgo+ID4g
T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDg6MTI6MTBBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+ID4+IDMwLjA5LjIwMjAgMDM6MzAsIE5pY29saW4gQ2hlbiDQv9C40YjQtdGCOgo+
ID4+IC4uLgo+ID4+PiAgaW50IHRlZ3JhX21jX3dyaXRlX2VtZW1fY29uZmlndXJhdGlvbihzdHJ1
Y3QgdGVncmFfbWMgKm1jLCB1bnNpZ25lZCBsb25nIHJhdGUpOwo+ID4+PiAgdW5zaWduZWQgaW50
IHRlZ3JhX21jX2dldF9lbWVtX2RldmljZV9jb3VudChzdHJ1Y3QgdGVncmFfbWMgKm1jKTsKPiA+
Pj4gK3N0cnVjdCB0ZWdyYV9tYyAqdGVncmFfZ2V0X21lbW9yeV9jb250cm9sbGVyKHZvaWQpOwo+
ID4+PiAgCj4gPj4+ICAjZW5kaWYgLyogX19TT0NfVEVHUkFfTUNfSF9fICovCj4gPj4+Cj4gPj4K
PiA+PiBUaGlzIHdpbGwgY29uZmxpY3Qgd2l0aCB0aGUgdGVncmEyMC1kZXZmcmVxIGRyaXZlciwg
eW91IHNob3VsZCBjaGFuZ2UgaXQKPiA+PiBhcyB3ZWxsLgo+ID4gCj4gPiBXaWxsIHJlbW92ZSB0
aGF0IGluIHYzLgo+ID4gCj4gPiBUaGFua3MKPiA+IAo+IAo+IFBsZWFzZSBhbHNvIGNvbnNpZGVy
IHRvIGFkZCBhIHJlc291cmNlLW1hbmFnZWQgdmFyaWFudCwgc2ltaWxhciB0byB3aGF0Cj4gSSBk
aWQgaGVyZToKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vZ3JhdGUtZHJpdmVyL2xpbnV4L2NvbW1p
dC8yMTA1ZTc2NjQwNjM3NzJkNzJmZWZlOTY5NmJkYWIwYjY4OGI5ZGUyCj4gCj4gSSB3YXMgZ29p
bmcgdG8gdXNlIGl0IGluIHRoZSBuZXh0IGl0ZXJhdGlvbiBvZiB0aGUgbWVtb3J5IGludGVyY29u
bmVjdAo+IHNlcmllcy4KPiAKPiBCdXQgbm93IGl0IGFsc28gd2lsbCBiZSBnb29kIGlmIHlvdSBj
b3VsZCBhZGQgdGhlIGRldm0gdmFyaWFudCB0byB5b3Vycwo+IFNNTVUgcGF0Y2hzZXQgc2luY2Ug
eW91J3JlIGFscmVhZHkgYWJvdXQgdG8gdG91Y2ggdGhlIHRlZ3JhMjAtZGV2ZnJlcQo+IGRyaXZl
ci4gSSdsbCB0aGVuIHJlYmFzZSBteSBwYXRjaGVzIG9uIHRvcCBvZiB5b3VycyBwYXRjaC4KCkp1
c3Qgc2F3IHRoaXMgcmVwbHkuIFllYSwgSSB0aGluayB0aGlzJ2QgYmUgYmV0dGVyLiBUaGFua3MK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFp
bGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
