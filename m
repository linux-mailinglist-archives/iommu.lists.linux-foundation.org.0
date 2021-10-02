Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D152A41F9EE
	for <lists.iommu@lfdr.de>; Sat,  2 Oct 2021 07:25:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16317425D0;
	Sat,  2 Oct 2021 05:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1y1hkccF4MhB; Sat,  2 Oct 2021 05:25:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3AA27425CC;
	Sat,  2 Oct 2021 05:25:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15477C001E;
	Sat,  2 Oct 2021 05:25:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04144C000D
 for <iommu@lists.linux-foundation.org>; Sat,  2 Oct 2021 05:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E156A403CB
 for <iommu@lists.linux-foundation.org>; Sat,  2 Oct 2021 05:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDEO78724Sis for <iommu@lists.linux-foundation.org>;
 Sat,  2 Oct 2021 05:25:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3238C400BD
 for <iommu@lists.linux-foundation.org>; Sat,  2 Oct 2021 05:25:17 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id t189so14168315oie.7
 for <iommu@lists.linux-foundation.org>; Fri, 01 Oct 2021 22:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=IgtTj7o3xWitFQk3UimI4ubG/5dzvlK98CvjtOHM1LQ=;
 b=S/GbNUMB1ugczsQiz1Gm8SqV0O9+hSBBjodwqKzmXF163yePd4+bZjqqACbJgNUo/H
 WTIUibsgAS7wKzolcdwMJZL4Y+I3UOMb3frYzRulHz1LYV4kh42XrVnxSAmznAOU88gZ
 2w+L/drTr2F1NRQQYAbMQTXLxZnL1+ORIR7cKZ0rQSqELsQ3Iki6n3LTDKQd5VhJwa9r
 MftAjgXyO5nurKKbyOFCiy9hZZBpW9Wrv/xkEdTZS6sW9Tw/9rS9qrdUNr4TI8/19fsB
 fcnRYAHZE8GPvFWHOOMGNXfVS/MPAMZpa68899SLes6MARJTe015HRDEzcq9YP3RtlY3
 lVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IgtTj7o3xWitFQk3UimI4ubG/5dzvlK98CvjtOHM1LQ=;
 b=OoOFOB7TxCR0DOvUu13kqWn9hjDGdetPpyrO6cmOFLQLhIjPWXdcK+k6OPMs4EXw3L
 yjNvp/eF/zotty2QPLuwyhsQD/eA0j1q7gA+AOhOsDDxcsfobyHVduVlY/efZzppKsCC
 mC/tLUlnJzX92BVj0GDtZiqlr92SZ1vujvE2VE9oR5lJ93wCm/kN8e12ciE2CR4sbYeU
 AbwxIZUgK7uZWQQvnp7GkZZB8MhaTC9nfY/yvTCBYDPROD4TbmMlTxp3hpNFcq3VTUg2
 midbOlvmSdoSHzaZBSxzN82Ch7tr3s2RrVC3qLAdjdKOJV/KHE/qj1Qn7cmw4Mk2Mu9v
 BeVw==
X-Gm-Message-State: AOAM531nObndCQt5cHciwAU+e5KSDxK/jSJ3pELEOJl9CiyvDxJnt1Uh
 5iVTe6+UIRkIlGxQALG7rtZZwE1VjfYaxvTKszI=
X-Google-Smtp-Source: ABdhPJxeRyByeao+rf/p07uKPiwGeTNlHXDH5c8YziNixBtdcgFWVuL1BTEZcNh/42Hj3cXLLr6UNrBrC48M5/62a/U=
X-Received: by 2002:a54:4f15:: with SMTP id e21mr6909062oiy.71.1633152316274; 
 Fri, 01 Oct 2021 22:25:16 -0700 (PDT)
MIME-Version: 1.0
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Sat, 2 Oct 2021 10:55:05 +0530
Message-ID: <CAHP4M8XpFCrhmWw2PO6D1aSMgW=EX-N6drcCGj5_vDEHGzYTWw@mail.gmail.com>
Subject: Upstream-Patching for iommu (intel)
To: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi All.

What is the upstream list, wherein patches for iommu (intel) might be posted?
Is it iommu@lists.linux-foundation.org?


Thanks and Regards,
Ajay
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
