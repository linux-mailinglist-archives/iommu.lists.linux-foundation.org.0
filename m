Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3AF27E0B6
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 07:55:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 979D620347;
	Wed, 30 Sep 2020 05:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8I4dEHv3Mme5; Wed, 30 Sep 2020 05:55:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7CB4A20386;
	Wed, 30 Sep 2020 05:55:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6567FC0889;
	Wed, 30 Sep 2020 05:55:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 321EFC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E31285FC9
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z2PuYR4_oNu4 for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 05:55:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2082F85F2F
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:55:40 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id bb1so344722plb.2
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ZKt1l06WBiOe5oSa8hvHMMaReLuZvec2hHg90p7XYZw=;
 b=Ha0J0YFFJbPQksFeyj5p+V9nuCr+5BSKAknv2WvbX953a+2DlUmJ6wy4K5XDXRMwg7
 /w7xQHmu0IsodtL9hWFAu0/LxDx0sVH6qUsXvXBhHK7esn1M2Aou30kHiz1SDOxk761X
 vxUyVBUPJ2B8jXI8kN97kwkIGvgDD0FcJ5h4Fw7+z2yAoOYB9btAMfuVVTpmx2+CeJUB
 DevOO0PMjyiFRJibfaW261V/zpVf9oLYHnydIaPfI5f9lSwAts/e92P/sDn41w5Ixg/g
 7wUnFg5WSW0+OzdRzb8dHqwT6qYP+LjOUaBy3MPcxvwiMITWeesV6FCzwRlmtAdCS6DO
 urVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZKt1l06WBiOe5oSa8hvHMMaReLuZvec2hHg90p7XYZw=;
 b=twHldPKuErkIPhIyb9ACnR7InYU4qj9YjlLXa8RePAZwmmF1UW0CmManWQ6aWay7CM
 5x+DHzs1W7zDUpvReiIYTI7Z2wehq+Sn3L2DkBfhLTV3XjeEyW24+v7nVSer1s21bp2v
 x28/ccdgJdTmk9p79mRqMKwTKzo2qdzz/YJTbyBU7c9QbSk0HDBMXzps1shsb/0XhJfo
 ZcBFSU4W/QDvRyR7iRk9S6L3zMoH25/Xgftml+neDwqKRVu1yP+mGmpZJ28oHt13uRIV
 NuOi4S5mFJ69lThkYwTFOM6JSNXgGQV24QB0TEcmMoxFVHmu9o0X3FiUWJCWHHoCXryO
 WLhg==
X-Gm-Message-State: AOAM531AXGbZrQsEL1QEObQfywueAzuBS6FVXw5CGzC10b1KF3QmJg/y
 US3t6Vo9BzlHuXzGn8n1Ilk=
X-Google-Smtp-Source: ABdhPJxxPH3+l0h0b3d77zTykpSEcWgLoj6N2dP/iZ7QevPI0t6mFehpDdcbtQHqGWvYygqI0MFMIw==
X-Received: by 2002:a17:90a:104f:: with SMTP id
 y15mr1019025pjd.45.1601445339766; 
 Tue, 29 Sep 2020 22:55:39 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id n2sm773071pfe.208.2020.09.29.22.55.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Sep 2020 22:55:39 -0700 (PDT)
Date: Tue, 29 Sep 2020 22:50:09 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930055008.GH31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <db183fdf-d566-599a-94ff-cfab0e08aa7a@gmail.com>
 <931eb16b-4529-2c20-c696-c57a9138aded@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <931eb16b-4529-2c20-c696-c57a9138aded@gmail.com>
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

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDg6MjA6NTBBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDMwLjA5LjIwMjAgMDg6MTAsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+
ID4gMzAuMDkuMjAyMCAwMzozMCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gPj4gIHN0YXRp
YyB2b2lkIHRlZ3JhX3NtbXVfcmVsZWFzZV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQo+ID4g
Cj4gPiBUaGUgdGVncmFfZ2V0X21lbW9yeV9jb250cm9sbGVyKCkgdXNlcyBvZl9maW5kX2Rldmlj
ZV9ieV9ub2RlKCksIGhlbmNlCj4gPiB0ZWdyYV9zbW11X3JlbGVhc2VfZGV2aWNlKCkgc2hvdWxk
IHB1dF9kZXZpY2UobWMpIGluIG9yZGVyIHRvIGJhbGFuY2UKPiA+IGJhY2sgdGhlIHJlZmNvdW50
aW5nLgo+ID4gCj4gCj4gQWN0dWFsbHksIHRoZSBwdXRfZGV2aWNlKG1jKSBzaG91bGQgYmUgcmln
aHQgYWZ0ZXIKPiB0ZWdyYV9nZXRfbWVtb3J5X2NvbnRyb2xsZXIoKSBpbiB0ZWdyYV9zbW11X3By
b2JlX2RldmljZSgpIGJlY2F1c2UgU01NVQo+IGlzIGEgcGFydCBvZiBNQywgaGVuY2UgTUMgY2Fu
J3QganVzdCBnbyBhd2F5LgoKV2lsbCBhZGQgaXQuIFRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0
IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBt
YWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
