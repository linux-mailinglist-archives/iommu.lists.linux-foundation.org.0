Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA7282DF9
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 00:10:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3FFE084948;
	Sun,  4 Oct 2020 22:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQy9FRCnpC7o; Sun,  4 Oct 2020 22:10:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C13DE84921;
	Sun,  4 Oct 2020 22:10:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8115C0051;
	Sun,  4 Oct 2020 22:10:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37EA4C0051
 for <iommu@lists.linux-foundation.org>; Sun,  4 Oct 2020 22:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0A01D203E4
 for <iommu@lists.linux-foundation.org>; Sun,  4 Oct 2020 22:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYLb5S-ENLzy for <iommu@lists.linux-foundation.org>;
 Sun,  4 Oct 2020 22:10:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id D154B203A5
 for <iommu@lists.linux-foundation.org>; Sun,  4 Oct 2020 22:10:20 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id az3so751790pjb.4
 for <iommu@lists.linux-foundation.org>; Sun, 04 Oct 2020 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=OQzkxKGyzm6JFhBLiUsozBGoWcCHRGIABPwIBAlSRLE=;
 b=k6k5GDo42aNXzh949rg/z30OVRag8e/ShW4sQJTZrjciBTIEh4ZuraWKz2JvdPd0Sg
 pk48L6TwL9Shrfcpg+8C2Vkxdf8OKfoD+O4WZIZ9glSzbpMiabxC+mSNuhnhthE1qvKL
 5F2ZnACOdOFTdF1LDWP9y5lXCkWP4JvGodLRUyqcyPXZMaDybCd8HdKb67Anqi82K2xu
 kUNOr9dyIqPPw+PssCLcZ2txnTa66hl9YEo6ZwPtiDHT4rf67miZBKCtIV5zBQEqWGK8
 22Tbzkoh2jUDUifQP4V6sjpSSrgDEuQz6/j+wbkR1VjrgAlb2gYtFb1NJ2SdyV+Hd5iO
 tqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OQzkxKGyzm6JFhBLiUsozBGoWcCHRGIABPwIBAlSRLE=;
 b=uQUAXdME8mOUHU+x7YVyAllTh36A5NHFnKbgeH4ceycjcZuskxd2zb7uuMSaZQ/N5B
 2zFfA9p+m+w6+jQSWbyEFvv32UP4P6Ik7RvK6vZ1j92DXbCwYpZPrjZdOHNELzaMdcfs
 LBykIMuTL5lMaXSBwFY0y5kULrxg6TTbgr9KsrKFMs9ygTOSc65wY2bDgTffxfnO5jUX
 ERPYKEps5YW8UP7a8M/1Q4G6r6JB+K4SJtwPG+yIemj5Z314dBnisn3pf8RAukVuC8wr
 llKb3TLMZdQySh1LI9E8bGhkZWtKjHkdR7yL2DbiamGVXO5BhSsGYaK4MzxEJHdoMHJM
 Kn/A==
X-Gm-Message-State: AOAM531o5HfdUFS/jkKUa7+pLvCiDu0Imay+9WIihM8uXCcsPWb/3sKm
 ajcr0KagGwq77VGRvGwHDlk=
X-Google-Smtp-Source: ABdhPJxl/7t+gO+zB4kzamD4T5F4Dlp0mz8AG0ZxG1Bep95oYXElnMKKu29cQuEUDFQxlwVmEaN2HA==
X-Received: by 2002:a17:90a:174e:: with SMTP id
 14mr7111874pjm.124.1601849420319; 
 Sun, 04 Oct 2020 15:10:20 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u6sm8153777pjy.37.2020.10.04.15.10.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Oct 2020 15:10:19 -0700 (PDT)
Date: Sun, 4 Oct 2020 15:04:00 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201004220359.GB21420@Asurada-Nvidia>
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
 <97d69b0b-db32-08ff-0691-73cfa571f974@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97d69b0b-db32-08ff-0691-73cfa571f974@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

T24gU2F0LCBPY3QgMDMsIDIwMjAgYXQgMDU6MDU6NTJQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDAzLjEwLjIwMjAgMDk6NTksIE5pY29saW4gQ2hlbiDQv9C40YjQtdGCOgo+ID4g
ICAgIHVidW50dUBqZXRzb246fiQgZG1lc2cgfCBncmVwIGlvbW11Cj4gPiAgICAgaW9tbXU6IERl
ZmF1bHQgZG9tYWluIHR5cGU6IFRyYW5zbGF0ZWQgCj4gPiAgICAgdGVncmEtaTJjIDcwMDBjNDAw
LmkyYzogQWRkaW5nIHRvIGlvbW11IGdyb3VwIDAKPiA+ICAgICB0ZWdyYS1pMmMgNzAwMGM1MDAu
aTJjOiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAgMAo+ID4gICAgIHRlZ3JhLWkyYyA3MDAwZDAwMC5p
MmM6IEFkZGluZyB0byBpb21tdSBncm91cCAwCj4gPiAgICAgdGVncmEtcGNpZSAxMDAzMDAwLnBj
aWU6IEFkZGluZyB0byBpb21tdSBncm91cCAxCj4gCj4gQ291bGQgeW91IHBsZWFzZSBleHBsYWlu
IGhvdyB5b3UgZ290IEkyQyBpbnRvIElPTU1VPwo+IAo+IEFyZSB5b3UgdGVzdGluZyB2YW5pbGxh
IHVwc3RyZWFtIGtlcm5lPyBVcHN0cmVhbSBEVCBkb2Vzbid0IGFzc2lnbiBBSEIKPiBncm91cCB0
byBJMkMgY29udHJvbGxlcnMsIG5vciB0byBBUEIgRE1BIGNvbnRyb2xsZXIuCgpJIGhhdmUgbG9j
YWwgRFQgY2hhbmdlcyBhZGRpbmcgaW9tbXVzIHByb3BlcnR5IGluIGkyYy9wY2llIG5vZGVzCnRv
IHRlc3QgZ3JvdXBfZGV2aWNlKCkgYW5kIHBjaSBkZXZpY2UsIHlldCBuZWl0aGVyIG9mIHRoZW0g
aXMgaW4KdmFuaWxsYSBrZXJuZWwuIFRoZSBsb2cgaXMgbWVyZWx5IHRvIHNob3cgdG8gcGVvcGxl
IHRoZSBzZXF1ZW5jZQpvZiBpb21tdSBjb3JlIHByaW9yIHRvIGNsaWVudHMuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdApp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
