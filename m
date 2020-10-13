Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D728C96A
	for <lists.iommu@lfdr.de>; Tue, 13 Oct 2020 09:31:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 213EA87ABB;
	Tue, 13 Oct 2020 07:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IiSQoTYumM9n; Tue, 13 Oct 2020 07:31:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9ADC787ABF;
	Tue, 13 Oct 2020 07:31:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D86AC1AD7;
	Tue, 13 Oct 2020 07:31:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 889E2C0051
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 07:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 76A6387994
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 07:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QggzaIvOUTG for <iommu@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 07:31:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BB0B7878BB
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 07:31:49 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id 67so21191947iob.8
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8elHjBbADG4GvNsj3EdxmL1/azNofpsxhsXHwpi5wJA=;
 b=HE5Fni69H1Ts6Mzf1OQbVCJMsO8eQBZnLWNM0ziUwR+JlnIg2a3QorWVs2mrz+c3h8
 h3W+NZjEAyEYYukEbjm8NWQ1xMk07TaiTfNxkw5EmxNel2XO1zyjomJNwCl9u8IaDLQe
 h/s5YsBQNbfwkgR64Kyw8bIw7lasOtsxLYtNKqgkkzrscYBLDqWq88++1W3XF09SY0YQ
 /FWo72n2fPbON4xhTo8eKMLs7my40Z210SuIrOGw1iHQjP6egEQ/qVccsTWn1JbLr9IQ
 /cH15YIIxG17YX+JktQTeVqoLmPZeO4G/jLc0gGSCvxN4PxEKJj52CAXuW1DFrEvPQCy
 15Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8elHjBbADG4GvNsj3EdxmL1/azNofpsxhsXHwpi5wJA=;
 b=F1Biv4GfK4AuAiPu4ywgVF8u4uOTyg5e8FM24Sv4Q/gSJdmkVMqDf++dOMTrDbS8Lb
 b4dbBdjodSY0T4KB2UKr0NxJq/9Nu8UTT09Jzq9ekG8Npm4LQ4iUoWzLjMmVX2MTNhzs
 vIUnInEssRdgcaHDDukaREfQxe5QUjYtC8ZUaMP9HuRMJFM+WEAqtmb6occ8PnP5TMDv
 OAF7TUt9xcR+DMJaHR382lR+wkcpBD5fRsVoOHo55lQ1hyxmYCuiTjMUPvXYj4NrJT58
 2GFC1Ki6HYvtftC0qFAc5t5aabutS7Hq3zZmkkuvQLwtThOj1bLItE4zBHlC5SEEr9lp
 +20A==
X-Gm-Message-State: AOAM5315T1hxKw6FV09bieA/ZwEmruUgB9qkbbjdp17pWuTksKIVJy7t
 ENQxxYf2Z4uqPZW0v86tGmUQ2eRBkNndQAo1lrjHtg==
X-Google-Smtp-Source: ABdhPJxFDGTT23DHZldxhxBqbTDCnu+xE4jDOIuZxypsqEVuC9tkxUB1XkFuAIA+s2uKw9aoiLtEszSPYQy+WIgizfk=
X-Received: by 2002:a6b:ef0e:: with SMTP id k14mr19321354ioh.131.1602574308924; 
 Tue, 13 Oct 2020 00:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123105.32652-1-brgl@bgdev.pl>
 <0071e295-51c7-3496-df59-c5712cef93a2@linux.intel.com>
In-Reply-To: <0071e295-51c7-3496-df59-c5712cef93a2@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Oct 2020 09:31:38 +0200
Message-ID: <CAMRc=MfNQGfW-jS4SNLxhmU6D8aN5f31N7qJkPjJ6izvXxXORg@mail.gmail.com>
Subject: Re: [PATCH next] iommu: intel: make DMAR_TABLE select IOMMU_API
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

T24gVHVlLCBPY3QgMTMsIDIwMjAgYXQgMzozMyBBTSBMdSBCYW9sdSA8YmFvbHUubHVAbGludXgu
aW50ZWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTAvMTIvMjAgODozMSBQTSwgQmFydG9z
eiBHb2xhc3pld3NraSB3cm90ZToKPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xh
c3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPgo+ID4gU2luY2UgY29tbWl0IGM0MGFhYWFjMTAxOCAo
ImlvbW11L3Z0LWQ6IEdyYWNlZnVsbHkgaGFuZGxlIERNQVIgdW5pdHMKPiA+IHdpdGggbm8gc3Vw
cG9ydGVkIGFkZHJlc3Mgd2lkdGhzIikgZG1hci5jIG5lZWRzIHN0cnVjdCBpb21tdV9kZXZpY2Ug
dG8KPiA+IGJlIGRlZmluZWQuIFdlIG5lZWQgdG8gdW5jb25kaXRpb25hbGx5IHNlbGVjdCBJT01N
VV9BUEkgd2hlbiBETUFSX1RBQkxFCj4gPiBpcyBzZWxlY3RlZC4gVGhpcyBmaXhlcyB0aGUgZm9s
bG93aW5nIGJ1aWxkIGVycm9yIHdoZW4gSU9NTVVfQVBJIGlzIG5vdAo+ID4gc2VsZWN0ZWQ6Cj4g
Pgo+ID4gZHJpdmVycy9pb21tdS9pbnRlbC9kbWFyLmM6IEluIGZ1bmN0aW9uIOKAmGZyZWVfaW9t
bXXigJk6Cj4gPiBkcml2ZXJzL2lvbW11L2ludGVsL2RtYXIuYzoxMTM5OjQxOiBlcnJvcjog4oCY
c3RydWN0IGlvbW11X2RldmljZeKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmG9wc+KAmQo+ID4g
ICAxMTM5IHwgIGlmIChpbnRlbF9pb21tdV9lbmFibGVkICYmIGlvbW11LT5pb21tdS5vcHMpIHsK
Pgo+IFRoYW5rcyEKPgo+IEhvdyBhYm91dCBtYWtpbmcgaXQgc3ltbWV0cmljIHdpdGggdGhlIHJl
Z2lzdHJhdGlvbiBjb2RlPwo+Cj4gICAgICAgICBpZiAoaW50ZWxfaW9tbXVfZW5hYmxlZCAmJiAh
aW9tbXUtPmRyaGQtPmlnbm9yZWQpCj4KPiBCZXN0IHJlZ2FyZHMsCj4gYmFvbHUKPgoKU291bmRz
IGdvb2QsIGp1c3Qgc2VudCBvdXQgYSBwYXRjaC4KCkJhcnRvc3oKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
