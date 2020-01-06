Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC1131670
	for <lists.iommu@lfdr.de>; Mon,  6 Jan 2020 18:06:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5760880C3;
	Mon,  6 Jan 2020 17:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJuY68ebDs1W; Mon,  6 Jan 2020 17:06:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1FD12880C2;
	Mon,  6 Jan 2020 17:06:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3E73C0881;
	Mon,  6 Jan 2020 17:05:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E966C0881
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 17:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 44609862A5
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 17:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aI_fua9VO3ej for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 17:05:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7A66386278
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578330356;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/Jnv8AW8cARo45YSP2c5MxZVqaP1EqLORh5B3m0bY2Q=;
 b=M+QP9oY14JRUseN0NpEgwjG1FqDOTIPPJk8oahArVGRKrdLOD4ZyDYknYP52DT5n/EjXCN
 MSLZ2K+f4A7ciBrj8gGCVoXSGl0Cn1Myrk3nO9gkJ9GrZzNyj08ScwErUcT8HnFS9ARRKM
 zR6bOv/kX1OmFVZU9fuhd/2aEj0KjOI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-mb3ddENQNV-VCtmAynGq6w-1; Mon, 06 Jan 2020 12:05:54 -0500
Received: by mail-yb1-f198.google.com with SMTP id 7so6500074ybc.5
 for <iommu@lists.linux-foundation.org>; Mon, 06 Jan 2020 09:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=/Jnv8AW8cARo45YSP2c5MxZVqaP1EqLORh5B3m0bY2Q=;
 b=GW8POhO0Ig64tpy9s1RBVkNmwliiCMHrJL8nFKxGDqXOMusWkUD5uAxm1ot9g9Cru6
 dXa0Ai2uNyaJZSILrbIpIbWBH1GeUDSeAmFjvXJ08kcBWloQ5yBjoXu+4tMrcMKz0pZ8
 lu0lEak2NYiPVyrQjyfuhHIoRGFSX1IXmygjXn7kZMCogswDY9eJ4bVVXFMTv3xUE8rI
 IR3U1bg/dx8RvvKqzYQAyh8nVOQ123BomZaQN+CNljE10JyI1BW2yUrx7E6mjh8vqh5p
 v3Ro8WhJ8DzjzkxDb6tIWUTlgVkat3YtynYER0EFnl6f+ommrtkfUmOQzuAbkrxomj4/
 p9rQ==
X-Gm-Message-State: APjAAAXC4KZur2TQOb4CCDRTX4vPwiSgVznN9bI9TUPEaZ2VvDSLwOdz
 ITK6Jf7f/VYrKjRJi6WnwLGlvDZnxIPBPtg3IQWle1RK7N1jcLes119tEIeSish5vi9spznA2mR
 nNJ5JHubp9yZfcF3fyFleXsXvueHvjQ==
X-Received: by 2002:a25:c6d5:: with SMTP id
 k204mr70106310ybf.184.1578330353678; 
 Mon, 06 Jan 2020 09:05:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqwObk6bwI33lCPTDDzKKOaYjbonQds0wvvd/uRkEDjBr4riKAjUwaMfu3LUuoOoyrvA5uR9Xg==
X-Received: by 2002:a25:c6d5:: with SMTP id
 k204mr70106278ybf.184.1578330353344; 
 Mon, 06 Jan 2020 09:05:53 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id d199sm28520771ywh.83.2020.01.06.09.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 09:05:52 -0800 (PST)
Date: Mon, 6 Jan 2020 10:05:51 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Roland Dreier <roland@purestorage.com>
Subject: Re: [PATCH 22/22] iommu/vt-d: Add a quirk flag for scope mismatched
 devices
Message-ID: <20200106170551.ykphn6couhxozrid@cantor>
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
 <20200102001823.21976-23-baolu.lu@linux.intel.com>
 <CAL1RGDWU=s6nVArvkci1cXyZVw-fvdtcOjuY+9E+rgBi65q=Aw@mail.gmail.com>
 <567f1506-4a13-535b-ce41-aac079941510@linux.intel.com>
 <CAL1RGDVF1icaeEWMe0r0VA8AaxtHGJZ8NHCpvJfT8+1duOUYAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL1RGDVF1icaeEWMe0r0VA8AaxtHGJZ8NHCpvJfT8+1duOUYAQ@mail.gmail.com>
X-MC-Unique: mb3ddENQNV-VCtmAynGq6w-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Jim Yan <jimyan@baidu.com>, iommu@lists.linux-foundation.org
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed Jan 01 20, Roland Dreier via iommu wrote:
>> We saw more devices with the same mismatch quirk. So maintaining them in
>> a quirk table will make it more readable and maintainable.
>
>I guess I disagree about the maintainable part, given that this patch
>already regresses Broadwell NTB.
>
>I'm not even sure what the DMAR table says about NTB on my Skylake
>systems, exactly because the existing code means I did not have any
>problems.  But we might need to add device 201Ch too.
>
>Maybe we don't need the mismatch check at all?  Your patch sets the
>quirk if any possibly mismatching device is present in the system, so
>we'll ignore any scope mismatch on a system with, say, the 8086:2020
>NVMe host in it.  So could we just drop the check completely and not
>have a quirk to disable the check?
>
> - R.

If the check is removed what happens for cases where there is an actual
problem in the dmar table? I just worked an issue with some Intel
people where a purley system had an rmrr entry pointing to a bridge as
the endpoint device instead of the raid module sitting behind it.

>_______________________________________________
>iommu mailing list
>iommu@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/iommu
>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
