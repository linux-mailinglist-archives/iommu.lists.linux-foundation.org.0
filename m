Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3191E2C2561
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 13:09:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B9C398583C;
	Tue, 24 Nov 2020 12:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDrLwJm654q9; Tue, 24 Nov 2020 12:09:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3583F85BB0;
	Tue, 24 Nov 2020 12:09:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1444CC1D9F;
	Tue, 24 Nov 2020 12:09:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31E44C0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 23D0F87294
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 12:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJfK1G2x72Da for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 12:09:34 +0000 (UTC)
X-Greylist: delayed 00:07:47 by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7C8BE87291
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 12:09:34 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j23so21682129iog.6
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 04:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OtTStFZ1K4vG9mf1OSlywjo0WPS9A+qPTfMdwg+0WeU=;
 b=B3BwzQbaXFU3fhtDdHR+Fmv8MKnhR2mxgOp2ryIc5wuXL4rXiS85tpU6q5H3eR6qE+
 6qzQoaoL8DgM+BofPoZTBWmfryCnozhhBT+EEK6ATwmvGtVQzE0xjmM4qt+tQ5k0iE0J
 0hdGRkNaK/blbkiRCF/yNOj+MFI3+N1/U+yak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OtTStFZ1K4vG9mf1OSlywjo0WPS9A+qPTfMdwg+0WeU=;
 b=dfbh0NVAnPQJPHb/V6VzU4/r7rIoTrbU01WsQwyXoGzRNMLrLdwqxWU0CbPSwXTUGZ
 oO9f4jr/mOqNQdJAxeiU3g8qWMpqwk/ilBliB3xn9aQmNnGsp5QQYFhAlkQkDFEmXQzB
 /fYdHTVIA4Bn1qs+2pC61XKNf0LzAynhfMkjjRXLzZMk06Mu/8mvFH1YS2KmxqBcORiy
 wRpXj4DsZPOKHxkqgksWQ/KvofEoh/jb38vGK+IMO+5KBcdSh6pFadC+nWD9ty3xPgJo
 JgaxhLAwY7TkR0Iarqic2bSphvL5ZPANa1Y7HIjyzJVb2higlCh+ZRtmKUYV0pAtRboV
 SW9w==
X-Gm-Message-State: AOAM5320HqLkK+vjF7F07RJzEbS0tCqRCx1bKm/mOIU0Y3Evpcy6bsXG
 GRdtD9sd6MPudl0GY8efcEYFVkl2BJIWvo+B
X-Google-Smtp-Source: ABdhPJyPjA32ktKMRMSxcUJK7/NydrQ9soE4XdI+VcwIGv68xbAara4fJt+U/aBp4GBmXjceVMikLQ==
X-Received: by 2002:a92:d40d:: with SMTP id q13mr3419773ilm.253.1606219306595; 
 Tue, 24 Nov 2020 04:01:46 -0800 (PST)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id t8sm9482201ilf.80.2020.11.24.04.01.45
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 04:01:46 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id v3so4864563ilo.5
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 04:01:45 -0800 (PST)
X-Received: by 2002:a05:6e02:12ab:: with SMTP id
 f11mr757703ilr.89.1606219305436; 
 Tue, 24 Nov 2020 04:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20200930160917.1234225-9-hch@lst.de>
 <20201118142546.170621-1-ribalda@chromium.org>
 <20201124113512.GA21974@lst.de>
In-Reply-To: <20201124113512.GA21974@lst.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Nov 2020 13:01:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
Message-ID: <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
Subject: Re: [PATCH] WIP! media: uvcvideo: Use dma_alloc_noncontiguos API
To: Christoph Hellwig <hch@lst.de>
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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

SEkgQ2hyaXN0b3BoCgpPbiBUdWUsIE5vdiAyNCwgMjAyMCBhdCAxMjozNSBQTSBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiAxOCwgMjAyMCBhdCAw
MzoyNTo0NlBNICswMTAwLCBSaWNhcmRvIFJpYmFsZGEgd3JvdGU6Cj4gPiBPbiBhcmNoaXRlY3R1
cmVzIHdoZXJlIHRoZSBpcyBubyBjb2hlcmVudCBjYWNoaW5nIHN1Y2ggYXMgQVJNIHVzZSB0aGUK
PiA+IGRtYV9hbGxvY19ub25jb250aWd1b3MgQVBJIGFuZCBoYW5kbGUgbWFudWFsbHkgdGhlIGNh
Y2hlIGZsdXNoaW5nIHVzaW5nCj4gPiBkbWFfc3luY19zaW5nbGUoKS4KPiA+Cj4gPiBXaXRoIHRo
aXMgcGF0Y2ggb24gdGhlIGFmZmVjdGVkIGFyY2hpdGVjdHVyZXMgd2UgY2FuIG1lYXN1cmUgdXAg
dG8gMjB4Cj4gPiBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBpbiB1dmNfdmlkZW9fY29weV9kYXRh
X3dvcmsoKS4KPgo+IFRoaXMgaGFzIGEgYnVuY2ggb2YgY3JhenkgbG9uZyBsaW5lcywgYnV0IG90
aGVyd2lzZSBsb29rcyBmaW5lIHRvIG1lLgoKVGhhdCBpcyBlYXN5IHRvIHNvbHZlIDopCgpodHRw
czovL2dpdGh1Yi5jb20vcmliYWxkYS9saW51eC9jb21taXQvMTdhYjY1YTA4MzAyZTg0NWFkN2Fl
Nzc3NWNlNTRiMzg3YTU4YTg4NwoKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gUmli
YWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+Cj4gPiBUaGlzIHBhdGNoIGRl
cGVuZHMgb24gZG1hX2FsbG9jX2NvbnRpZ3VvdXMgQVBJ77+8MTMxNTM1MWRpZmZtYm94c2VyaWVz
Cj4KPiBIb3cgZG8gd2Ugd2FudCB0byBwcm9jZWVkPyAgRG8gdGhlIG1lZGlhIG1haW50YWluZXJz
IHdhbnQgdG8gcGljayB1cAo+IHRoYXQgcGF0Y2g/ICBTaG91bGQgSSBwaWNrIHVwIHRoZSBtZWRp
YSBwYXRjaCBpbiB0aGUgZG1hLW1hcHBpbmcgdHJlZT8KCkkgd2FzIGhvcGluZyB0aGF0IHlvdSBj
b3VsZCBhbnN3ZXIgdGhhdCBxdWVzdGlvbiA6KS4KCkRvIHlvdSBoYXZlIG90aGVyIHVzZS1jYXNl
cyB0aGFuIGxpbnV4LW1lZGlhIGluIG1pbmQ/CgpJIHRoaW5rIFNlcmdleSB3YW50cyB0byBleHBl
cmltZW50IGFsc28gd2l0aCB2YjIsIHRvIGZpZ3VyZSBvdXQgaG93Cm11Y2ggaXQgYWZmZWN0cyBp
dC4KSGlzIGNoYW5nZSB3aWxsIGJlIG11Y2ggbW9yZSBjb21wbGljYXRlZCB0aGFuIG1pbmUgdGhv
dWdodCwgdGhlcmUgYXJlCm1vcmUgY29ybmVyY2FzZXMgdGhlcmUuCgo+Cj4gQ2FuIHlvdSByZXNw
b3N0IGEgY29tYmluZWQgc2VyaWVzIHRvIGdldCBzdGFydGVkPwoKU3VyZS4gU2hhbGwgSSBhbHNv
IGluY2x1ZGUgdGhlIHByb2ZpbGluZyBwYXRjaD8KCgpCZXN0IHJlZ2FyZHMKLS0gClJpY2FyZG8g
UmliYWxkYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
b21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
